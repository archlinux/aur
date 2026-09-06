# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=fastpotify
pkgver=0.7.0
pkgrel=1
pkgdesc="Native Spotify client"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/fastpotify"
license=('MIT')
install="${pkgname}.install"
depends=('alsa-lib' 'libpulse' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
makedepends=('cargo' 'cmake' 'clang')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'pipewire-pulse: PipeWire as the PulseAudio server')
conflicts=('fastpotify-bin' 'fastpotify-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which lld then cannot resolve: the link fails on
# undefined ring_core_* symbols.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/fastpotify-v${pkgver}-source.tar.gz")
sha256sums=('e2b43de4d36ca266b7b424b346dd4b8bcce43af946e5e3d1ec4a14ff46056b7f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Generated bindings inside glutin carry the path they were built at, which
  # ends up in the binary and makes makepkg warn about a reference to $srcdir.
  # Appended rather than assigned, so the distro's own flags survive.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # The demo feature carries the headless render test, which lays out every
  # page without a display and talks to nothing.
  cargo test --frozen --features demo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/fastpotify" "${pkgdir}/usr/bin/fastpotify"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/fastpotify.desktop" \
    "${pkgdir}/usr/share/applications/fastpotify.desktop"
  install -Dm644 "packaging/icons/fastpotify.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/fastpotify.svg"
}
