# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=quarg
pkgver=0.1.3
pkgrel=1
pkgdesc='A command-line search tool for Quassel'
arch=('x86_64')
url='https://oriole.systems/posts/quarg'
license=('MIT')
depends=('python' 'python-dateutil' 'python-sqlalchemy>=1.4')
makedepends=('signify' 'python-setuptools')
optdepends=('python-psycopg2: for PostgreSQL')
source=("https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.signify::https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz.asc"
        "quarg-release.pub::https://oriole.systems/release.pub")
sha256sums=('f11473a0228e6674d06352abda402bf976f0f5e8e27213502deb8b1016c35e2a'
            'b1baf17ccadd453cf05e6db430fdb8e581e7bbebffe538c452c31bd2a5375f94'
            '9a9b86aabca218831ba3a03878b4473b7c2407be46a5fae11716ba18d2a78918')

prepare() {
	signify -C -p quarg-release.pub -m "${pkgname}-${pkgver}.tar.gz" -x "${pkgname}-${pkgver}.tar.gz.signify"
}

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "${pkgdir}/usr/share/man/man1/" 'quarg.1'
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
