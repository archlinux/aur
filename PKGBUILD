# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cachebag
_pkgname=unrot
_cratename=${_pkgname}
_appname=unrot
pkgname=${_cratename}
pkgdesc="Find and interactively repair broken symlinks with fuzzy matching"

pkgver=0.1.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/main"

license=('MIT' 'Apache-2.0')

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
sha256sums=('dab833abd1793698c82476bcd2af96ad3efee564effc87f4ea290f37953c1d72'
            'f265a39150567f96d909f03b95fad8c13e3c5b4751e46d4febf7e425342640a8'
            '5e066d90b93d7065d671c16c150d911e846887a2d1e9f0550f01009e744eb3b0'
            'b586944a185a37ea9e8867c4f373a162891c28123a2dadac4ae7a5d500b4bff7')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "../LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
