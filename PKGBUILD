# Maintainer: Frédéric Logier <fredix@protonmail.com>
_name=notedeck
_tag=0.7.1
pkgname=notedeck-git
pkgver=0.7.1.r0.gea65af8d
pkgrel=1
epoch=
pkgdesc="The nostr browser"
arch=('x86_64' 'aarch64')
url="https://github.com/damus-io/notedeck"
license=('GPL-3')
groups=()
makedepends=(
  'git'
  'rust'
)
checkdepends=()
optdepends=()
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
options=('!lto')
install=
changelog=
source=("git+${url}.git#tag=v${_tag}")

noextract=()
sha256sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "$srcdir/notedeck"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/notedeck"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "$srcdir/notedeck"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release 
}


check() {
  cd "$srcdir/notedeck"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo check --release --bin notedeck
}

package() {
	cd "$srcdir/notedeck/target/release/"
        install -Dm755 --no-target-directory "notedeck" "${pkgdir}/usr/bin/${_name}"
}
