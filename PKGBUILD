# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=4.0.1
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=('any')
url="https://www.openshot.org"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme'
         'libopenshot'
         'python'
         'python-certifi'
         'python-defusedxml'
         'python-distro'
         'python-numpy'
         'python-opengl'
         'python-pillow'
         'python-pyqt6'
         'python-requests'
         'qt6-scxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v${pkgver}.tar.gz")
sha512sums=('7e5aa98a8791b39a7ec7ce316db5ee10c8a7483c6f62e61474956ea926d028ff82247ea7adecce5171a13815ff11d3a74217ccbedf84be7c734a6a12511dc592')
b2sums=('2c30267dea60af52abdfc7a7203ea2f3465715ffae86aef269325e2daf9d2b346d2fbc365b0a46fe14e67745d244eb922268d1379752498f1a56289a27d9f134')

prepare() {
    cd "${pkgname}-qt-${pkgver}"
    sed -i 's/from qt_api/from .qt_api/' src/launch.py
}

build() {
    cd "${pkgname}-qt-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-qt-${pkgver}/dist"
    python -m installer --destdir="${pkgdir}" *.whl

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "${pkgdir}/${site_packages}/${pkgname}_qt/tests"
}
