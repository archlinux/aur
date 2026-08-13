# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=cachebag
_pkgname=unrot
_cratename=${_pkgname}
_appname=unrot
pkgname=${_cratename}
pkgdesc="Find and interactively repair broken symlinks with fuzzy matching"

pkgver=0.1.1
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
sha256sums=('aa11687d1eb9cdb60b79ffd0d6a493a46f5a98f84c40f2c0e4d77354fcbaf704'
            '318ae5bc9d6cb4ef2cec8652ef4d4efbe9a238c04ec0c2f3e44cb9f596835845'
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
