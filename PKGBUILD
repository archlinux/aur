# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_cratesio_package='flux-cli'

pkgname="${_cratesio_package%%-cli}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Search, monitor, and nuke processes with ease, with system resource tracking"

license=('MIT')
arch=('any')

_url_cratesio='https://crates.io/crates/flux-cli'
_url_github='https://github.com/VG-dev1/flux'
url="${_url_github}"

provides=("${pkgname}")

depends=('glibc' 'gcc-libs')
makedepends=('rust')

# source=("${pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_cratesio_package}/${pkgver}/download")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18ecefa807819a6cc6ff7ded39046e0247ec33f7c7ed572c198486c501e4ed55')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
