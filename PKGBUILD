# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=quarg
pkgver=1.0.0
pkgrel=1
pkgdesc='A command-line search tool for Quassel'
arch=('x86_64')
url='https://oriole.systems/posts/quarg'
license=('MIT')
depends=('python' 'python-dateutil' 'python-sqlalchemy>=2')
makedepends=('signify' 'python-build' 'python-installer' 'python-poetry' 'python-wheel')
optdepends=('python-psycopg: for PostgreSQL')
source=("https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.signify::https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz.asc"
        "quarg-release.pub::https://oriole.systems/release.pub")
sha256sums=('43476872a964f5e825fd82fd3052994b11bdbd0b84b5e87d348319b2b643e643'
            '152de99216c05356519c685c41beb54871865beeb323c0a389882e5b1bef2355'
            '9a9b86aabca218831ba3a03878b4473b7c2407be46a5fae11716ba18d2a78918')
sha512sums=('5dd8f9a41ffae31e6078cb2aac5a314f0d1b68aa9b10e4161e1d4a7241c31d4ae2cf890a32397f9cc7fab80c0564f12c1a43cc23aaf459c7603884801161de98'
            '2cb0ee693c5a95f87d3fd0079dc84f64b48f1d7a87da5d3f7c960021ce353353e2dae35bf33e57389163fe5bbd07857dc6553ac0450eb02a19c67801eeb08e58'
            '745154dca7eacf67d1bc7cab07a600167591c87910af4abaf7869cee2830d92baadfa3d5439e544d00e22b0a3d2b6e0d136b4c8add141abb7a58bb1944217f71')

prepare() {
	signify -C -p quarg-release.pub -m "${pkgname}-${pkgver}.tar.gz" -x "${pkgname}-${pkgver}.tar.gz.signify"
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "${pkgdir}/usr/share/man/man1/" 'quarg.1'
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
