# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=codeprakhar25
_pkgname=inspect
_appname=${_pkgname}
pkgname=${_pkgname}-sh
pkgdesc="Get to know about commands before you execute them"

pkgver=0.1.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'gcc-libs')
optdepends=('ollama')

provides=("${_appname}")

source=("${_pkgname}-${_pkgvername}.tgz::${url}/archive/v${_pkgvername}.tar.gz")
sha256sums=('2ee1954c392842c2205f04dad52740d512376a1813ce086fdecbeae57e57524e')


prepare() {
  cd ${srcdir}/${_pkgname}-${_pkgvername} || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_pkgname}-${_pkgvername} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd ${srcdir}/${_pkgname}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
