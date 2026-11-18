# Maintainer: 3ri4nG0ld <brianldg92@gmail.com>
pkgname=epixnet
_reponame=EpixNet
pkgver=0.6.8
pkgrel=1
pkgdesc="Decentralized peer-to-peer web platform (node, browser launcher, and EVX worker)"
arch=('x86_64' 'aarch64')
url="https://github.com/EpixZone/EpixNet"
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'systemd-libs'
  'zlib'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
  'protobuf'
)
optdepends=(
  'firefox-esr-bin: recommended browser allowing unsigned Epix Wallet extension'
  'firefox: standard web browser (runs without wallet extension due to signature enforcement)'
  'libayatana-appindicator: system tray icon support (dlopened at runtime)'
)
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
options=('!lto')
_archive="${_reponame}-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('685b4bdc106acd261d8246696fcc3005883a4344bcb383313fb1dfd0121aaefc')

prepare() {
  cd "${srcdir}/${_archive}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_archive}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export EPIX_VERSION="${pkgver}"
  cargo build --release --locked -p epix-browser -p epix-nmh -p epix-server -p evx-worker
}

package() {
  cd "${srcdir}/${_archive}"

  # Internal directory for binaries
  install -Dm755 target/release/epix-browser "${pkgdir}/usr/lib/${pkgname}/epix-browser"
  install -Dm755 target/release/epix-nmh "${pkgdir}/usr/lib/${pkgname}/epix-nmh"
  install -Dm755 target/release/epix-server "${pkgdir}/usr/lib/${pkgname}/epix-server"
  install -Dm755 target/release/evx-worker "${pkgdir}/usr/lib/${pkgname}/evx-worker"

  # Executable symlinks in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/epix-browser" "${pkgdir}/usr/bin/epix-browser"
  ln -s "/usr/lib/${pkgname}/epix-browser" "${pkgdir}/usr/bin/epixnet"
  ln -s "/usr/lib/${pkgname}/epix-nmh" "${pkgdir}/usr/bin/epix-nmh"
  ln -s "/usr/lib/${pkgname}/epix-server" "${pkgdir}/usr/bin/epix-server"
  ln -s "/usr/lib/${pkgname}/evx-worker" "${pkgdir}/usr/bin/evx-worker"

  # Desktop entry and hicolor icons
  install -Dm644 packaging/linux/epix.desktop "${pkgdir}/usr/share/applications/epix.desktop"
  for s in 48 64 128 256 512; do
    install -Dm644 "packaging/linux/icons/epix-${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/epix.png"
  done

  # Confinement helper script
  install -Dm755 packaging/linux/enable-sandbox.sh \
    "${pkgdir}/usr/share/${pkgname}/enable-sandbox.sh"

  # License and documentation
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
