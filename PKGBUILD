# Maintainer: Matt Robinson <aur@nerdoftheherd.com>
# Contributor: Jaan Toots <jaan@jaantoots.org>
pkgname=goobook
pkgver=3.5.2
pkgrel=5
pkgdesc="Access your Google contacts from the command line"
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL3')
depends=('python-google-api-python-client'
         'python-oauth2client'
         'python-pyparsing'
         'python-pyxdg'
         'python-setuptools'
         'python-simplejson')
makedepends=('python-build'
             'python-docutils'
             'python-installer'
             'python-poetry')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        0001-Fix-warning-about-pkg_resources-being-deprecated.patch)
sha256sums=('a2182068ec1fbb0d37869e224c99ea70971f78525596a7af7a3e4803e0614c91'
            '3ec6377002d1ab05ec837091c5863872fe257702769b5a1b5ff9484328655339')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "${srcdir}/0001-Fix-warning-about-pkg_resources-being-deprecated.patch"
}

build() {
    cd "$pkgname-$pkgver"
    rst2man --strict goobook.1.rst goobook.1
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.rst" "CHANGES.rst"
}
