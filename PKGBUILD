# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5.6-webkit
pkgver=5.6.1
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Classes for a WebKit2 based implementation and a new QML API'
depends=('qt5.6' 'libwebp' 'libxslt' 'libxcomposite' 'gst-plugins-base')
makedepends=('ruby' 'gperf' 'python2')
optdepends=('gst-plugins-good: Webm codec support')
_tarname="qtwebkit-opensource-src-${pkgver}"
source=("http://download.qt.io/community_releases/${pkgver%.*}/${pkgver}/${_tarname}.tar.xz")
md5sums=('9ea7cb557375ba2fc7c62742c522d093')

_qmake="/opt/qt${pkgver%.*}/bin/qmake"

prepare() {
    cd ${_tarname}

    # Workaround for build-time python calls
    mkdir -p "${srcdir}"/python2-path
    ln -sf /usr/bin/python2 "${srcdir}"/python2-path/python
    export PATH="${srcdir}/python2-path:$PATH"
}

build() {
    cd ${_tarname}

    ${_qmake}
    make
}

package() {
    cd ${_tarname}
    make INSTALL_ROOT="$pkgdir" install

    install -d "$pkgdir"/usr/share/licenses
    ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
