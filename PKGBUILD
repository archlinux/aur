# Maintainer: Martin Pugh <martin at parity dot io>
# Contributor: Ashley Ruglys <ashley dot ruglys at gmail dot com>
_appname=polkadot
pkgname=${_appname}-git
pkgdesc="Polkadot Node Implementation built from current git master"
pkgrel=1
pkgver=0.7.34.814
arch=('i686' 'x86_64')
provides=("${_appname}")
conflicts=("${_appname}")
url="https://github.com/paritytech/${_appname}"
license=('GPL3')
makedepends=('rustup' 'clang')
source=("${_appname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_appname}"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
  rustup install nightly
  rustup target add wasm32-unknown-unknown
	cd "${srcdir}/${_appname}"
	cargo build --release
}

package() {
	install -D -m755 "${srcdir}/${_appname}/target/release/polkadot" "$pkgdir/usr/bin/polkadot"
}
