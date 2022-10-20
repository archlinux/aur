# Maintainer: Avery Warddhana <nullableVoidPtr+arch _ gmail>

pkgname=python-qiling-git
pkgver=1.4.4.r268.g3e18c093
pkgrel=1
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('any')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile'
         'python-registry' 'python-keystone' 'python-pyelftools'
         'python-gevent' 'python-multiprocess' 'python-yaml'
         'python-fx' 'python-questionary' 'python-termcolor')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname::git+https://github.com/qilingframework/qiling.git#branch=dev"
        '001-fix-qltui.patch')
sha256sums=('SKIP'
            'c487e8b57c5b270e2d457a844a51e40591640ca6d9c26fb1900988f0b0c1ef9b')

pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/001-fix-qltui.patch"
}

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" -O1 --skip-build
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set et sw=4 sts=4:
