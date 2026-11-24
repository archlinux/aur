# Maintainer: 3ri4nG0ld <brianldg92@gmail.com>
pkgname=epixnet-git
_pkgname=epixnet
pkgver=0.6.11.r1.g6f4ee73
pkgrel=1
_ffver="153.7.0esr"
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
  'libx11'
  'libxcb'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'zlib'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
  'protobuf'
  'python'
)
optdepends=(
  'libayatana-appindicator: system tray icon support (dlopened at runtime)'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
options=('!lto' '!strip')
source=(
  "${_pkgname}::git+${url}.git#branch=main"
)
source_x86_64=("firefox-${_ffver}-x86_64.tar.xz::https://download-installer.cdn.mozilla.net/pub/firefox/releases/${_ffver}/linux-${CARCH}/en-US/firefox-${_ffver}.tar.xz")
source_aarch64=("firefox-${_ffver}-aarch64.tar.xz::https://download-installer.cdn.mozilla.net/pub/firefox/releases/${_ffver}/linux-${CARCH}/en-US/firefox-${_ffver}.tar.xz")
sha256sums=('SKIP')
sha256sums_x86_64=('7d2eb92ca3a7b2a83de092eb9b94c853980214de2fbfdccb2ac39d61c593c5a5')
sha256sums_aarch64=('6dbe169c1be4fdcecab414f748237d792a9f02b07a735f31a887e577b5140b8f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p epix-browser -p epix-nmh -p epix-server -p evx-worker

  # Prepare bundled Firefox ESR with EpixNet extensions and security policies
  bash packaging/linux/prepare-firefox.sh "${srcdir}/firefox"
}

package() {
  # Internal directory for binaries and bundled Firefox ESR
  install -Dm755 "${srcdir}/${_pkgname}/target/release/epix-browser" "${pkgdir}/usr/lib/${_pkgname}/epix-browser"
  install -Dm755 "${srcdir}/${_pkgname}/target/release/epix-nmh" "${pkgdir}/usr/lib/${_pkgname}/epix-nmh"
  install -Dm755 "${srcdir}/${_pkgname}/target/release/epix-server" "${pkgdir}/usr/lib/${_pkgname}/epix-server"
  install -Dm755 "${srcdir}/${_pkgname}/target/release/evx-worker" "${pkgdir}/usr/lib/${_pkgname}/evx-worker"

  install -d "${pkgdir}/usr/lib/${_pkgname}/firefox"
  cp -a "${srcdir}/firefox/." "${pkgdir}/usr/lib/${_pkgname}/firefox/"

  # Executable symlinks in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/epix-browser" "${pkgdir}/usr/bin/epix-browser"
  ln -s "/usr/lib/${_pkgname}/epix-browser" "${pkgdir}/usr/bin/epixnet"
  ln -s "/usr/lib/${_pkgname}/epix-nmh" "${pkgdir}/usr/bin/epix-nmh"
  ln -s "/usr/lib/${_pkgname}/epix-server" "${pkgdir}/usr/bin/epix-server"
  ln -s "/usr/lib/${_pkgname}/evx-worker" "${pkgdir}/usr/bin/evx-worker"

  # Desktop entry and hicolor icons
  cd "${srcdir}/${_pkgname}"
  install -Dm644 packaging/linux/epix.desktop "${pkgdir}/usr/share/applications/epix.desktop"
  for s in 48 64 128 256 512; do
    install -Dm644 "packaging/linux/icons/epix-${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/epix.png"
  done

  # Confinement helper script
  install -Dm755 packaging/linux/enable-sandbox.sh \
    "${pkgdir}/usr/share/${_pkgname}/enable-sandbox.sh"

  # License and documentation
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
