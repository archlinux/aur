# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=cesarferreira
_pkgname=robin
_cratename=${_pkgname}_cli_tool
_appname=robin
pkgname=${_cratename//_/-}
pkgdesc="A CLI tool to run scripts for any project"

pkgver=1.3.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf' 'openssl')
depends=('glibc' 'gcc-libs' 'openssl')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('c255a103fdc931bc068b1e6170066a2891ccb86441a38d800e65673ea344c089')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
