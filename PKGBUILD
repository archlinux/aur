# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=cesarferreira
_pkgname=pirata
_cratename=${_pkgname}
pkgname=${_cratename}
pkgdesc="Search and download torrents via the CLI"

pkgver=0.1.1
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust')
depends=('glibc' 'gcc-libs')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('a758f02763326021589c5126d79584f8f67b77aed183a6a0a086be4f6c99a91f')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_cratename%%-cli}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
