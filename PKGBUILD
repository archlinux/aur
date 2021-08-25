# Maintainer: Astro Benzene <miguel@archlinux.net>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=python-gdl
pkgver=1.0.0
pkgrel=1
pkgdesc="Python interface for the GNU Data Language(GDL)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net"
license=('GPL')
depends=("gnudatalanguage=${pkgver}")
makedepends=('cmake')
#options=('!makeflags')
conflicts=('python2-gdl')
source=("https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        'gdl.profile')
md5sums=('08fd60b29a487445dea719790d51eb48'
         '40aa5fd8278cd8e80425c62a577563cc')

prepare() {
    cd ${srcdir}/gdl-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=ON -DFFTW=ON -DGLPK=ON \
        -DGRAPHICSMAGICK=ON -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON -DNETCDF=ON \
        -DPYTHON_MODULE=ON -DREADLINE=ON -DSHAPELIB=ON -DUDUNITS2=ON \
        -DPYTHON=ON -DPYTHONVERSION=3 ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    if [[ -d ../pkginstall ]]; then
        rm -r ../pkginstall
    fi
    mkdir ../pkginstall
    make DESTDIR=../pkginstall install

    install -D -m755 -t "${pkgdir}/usr/lib/python${_pyver}/site-packages" ../pkginstall/usr/lib/python"${_pyver}"/site-packages/GDL.so
    install -m755 -t "${pkgdir}/usr/lib" ../pkginstall/usr/lib/libantlr.so
    install -D -m644 -t "${pkgdir}/usr/share/doc/gnudatalanguage" ../PYTHON.txt
}
