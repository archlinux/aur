# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=quarg
pkgver=1.1.0
pkgrel=1
pkgdesc='A command-line search tool for Quassel'
arch=('x86_64')
url='https://oriole.systems/posts/quarg'
license=('MIT')
depends=('python' 'python-dateutil' 'python-sqlalchemy>=2')
makedepends=('signify' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
optdepends=('python-psycopg: for PostgreSQL')
source=("https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.signify::https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz.asc"
        "quarg-release.pub::https://oriole.systems/release.pub")
sha256sums=('1edd4e6336e42a4de54656f252db19c0da8ac40d3599137a7c3bf76ea339d5f0'
            '596f2b279f292b6d98acc9fc7206bef4b92f50669bae5abf64e397d29a77d8f6'
            '9a9b86aabca218831ba3a03878b4473b7c2407be46a5fae11716ba18d2a78918')
sha512sums=('bad65630d464c0da7a0946aa76d06bd0a2fabb19a9990e3291d4e4a159706705e4de320977c26a08f4547bc96c4839e7242efdc6cff69bf22a068e000f900086'
            '7d58c9cf16c6145d20666e63d31af7c99a57fbeeca8698b5ca8d8a2f6b8a2ef60e9e1ade37de0a1c9685c27a04f6b8d14dbeb6684164a14e5325b2948ffe48f3'
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
