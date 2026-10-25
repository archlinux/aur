# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=superradcompany
_pkgname=microsandbox
_pkgalias=msb
_cratename=${_pkgname}
pkgname=${_cratename}
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.7.11
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('Apache-2.0')

provides=("${_pkgname}" "${_pkgalias}")

makedepends=('clang' 'cargo')
depends=('glibc' 'libgcc')

options=('!strip' '!lto')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('1f7eeda1df06e0ad57656850810d5c564601039f6cfb2b00d8e03958c857862e')


prepare() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	export CC="clang"
	export CXX="clang++"

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_cratename}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -sf "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgalias}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
