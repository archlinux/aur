# Maintainer: Kevin McNamara (github.com/kjmcnamara1)
pkgname=cecilia-git
_name=cecilia
pkgver=0.45.1.r0.g0000000
pkgrel=1
pkgdesc='Keyboard-first editor and player for guitar tab, standard notation and Gregorian chant (git version)'
arch=('x86_64' 'aarch64')
url='https://kjmcnamara1.github.io/cecilia/'
_repo='https://github.com/kjmcnamara1/cecilia'
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
# makepkg's -flto breaks the C++ in signalsmith-stretch (undefined symbols at link time).
options=('!lto')
# The window (--gui) loads these at run time; the terminal UI needs none of them.
optdepends=('vulkan-icd-loader: GPU drawing in the window'
            'libxkbcommon: keyboard input in the window'
            'wayland: Wayland window'
            'libx11: X11 window'
            'libxcursor: X11 mouse cursors')
provides=("$_name=${pkgver%%.r*}")
conflicts=("$_name")
source=("$_name::git+$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  # v0.45.1-12-gabc1234 -> 0.45.1.r12.gabc1234
  git describe --long --tags --match 'v*' | sed 's/^v//; s/\([^-]*\)-\([0-9]*\)-\(g[0-9a-f]*\)$/\1.r\2.\3/'
}

prepare() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --release --frozen -p cecilia
}

check() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --release --frozen --workspace
}

package() {
  cd "$_name"
  packaging/linux/stage.sh "$pkgdir" /usr target/release/cecilia
}
