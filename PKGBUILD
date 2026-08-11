# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=tonepush-git
pkgver=0.4.0.r0.8283a0d
pkgrel=1
pkgdesc="Open-source editor for Line 6 Helix and HX pedals, with a GUI and a scriptable CLI"
arch=('x86_64' 'aarch64')
url="https://tonepush.rocks"
license=('MIT')
install="${pkgname}.install"
makedepends=('git' 'cargo' 'libxkbcommon' 'wayland' 'mesa')
optdepends=('libgl: for the GUI'
            'libxkbcommon: for the GUI'
            'wayland: for the GUI on Wayland'
            'libx11: for the GUI on X11'
            'p7zip: extract HX Edit model data from inside the app')
provides=('tonepush')
conflicts=('tonepush' 'stompchain-git')
replaces=('stompchain-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which lld then cannot resolve: the link fails on
# undefined ring_core_* symbols. The stable package is prebuilt and never meets
# this.
options=('!debug' '!lto')
source=("${pkgname}::git+https://github.com/crmne/tonepush.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\-/.r/;s/\-g/./'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Generated bindings inside glutin carry the path they were built at, which
  # ends up in the binary and makes makepkg warn about a reference to $srcdir.
  # Appended rather than assigned, so the distro's own flags survive.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  # The editor and the CLI by name. Building the whole workspace would drag in
  # the Ruby extension, which links against libruby and is nothing to do with
  # this package.
  cargo build --frozen --release -p hx-cli -p hx-gui
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  # Needs no hardware; the tests that talk to a device are #[ignore]d.
  cargo test --frozen -p hx-proto -p hx-catalog -p hx-cli -p hx-gui
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "target/release/tonepush" "${pkgdir}/usr/bin/tonepush"
  install -Dm755 "target/release/tonepush-gui" "${pkgdir}/usr/bin/tonepush-gui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/tonepush.desktop" \
    "${pkgdir}/usr/share/applications/tonepush.desktop"
  install -Dm644 "packaging/icons/tonepush.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tonepush.svg"
  install -Dm644 "packaging/udev/70-line6-hx.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/70-line6-hx.rules"
}
