# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=fastsapp
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast native WhatsApp client built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/fastsapp"
license=('MIT')
install="${pkgname}.install"
depends=('alsa-lib' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
makedepends=('cargo' 'cmake')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
conflicts=('fastsapp-bin' 'fastsapp-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which lld then cannot resolve: the link fails on
# undefined ring_core_* symbols. The stable package is prebuilt and never
# meets this.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crmne/fastsapp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a528ff3af13bcdbec66b8c086312eb9f2358e82d5d93eec4f51723e8a468e3e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # whatsapp-rust is a git dependency pinned to a commit; the lockfile
  # names it, so this fetches it along with everything else.
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
  # The demo feature carries the headless layout test of every screen,
  # which needs no display and talks to nothing.
  cargo test --frozen --features demo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/fastsapp" "${pkgdir}/usr/bin/fastsapp"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/fastsapp.desktop" \
    "${pkgdir}/usr/share/applications/fastsapp.desktop"
  install -Dm644 "packaging/icons/fastsapp.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/fastsapp.svg"
}
