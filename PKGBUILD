# Maintainer: Astro Benzene <miguel@archlinux.net>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=python-gdl
pkgver=0.9.9
pkgrel=2
pkgdesc="Python interface for the GNU Data Language(GDL)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=("gnudatalanguage=${pkgver}")
makedepends=('cmake' 'python')
#options=('!makeflags')
conflicts=('python2-gdl')
source=("https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
#       'gdl-tirpc.patch'
#       'gdl-updates.patch'
        'gdl-python3.patch'
        'gdl-graphicsmagick.patch'
        'gdl.profile')
md5sums=('749dc9b6dd0b9a5385ffe83e7b1a6f46'
         'f757aec04c3149e5cd003990d50c8fa4'
         '366bb65898facb4112dd213fe20c69e3'
         '40aa5fd8278cd8e80425c62a577563cc')

prepare() {
    cd ${srcdir}/gdl-${pkgver}

#   patch -p1 < ../gdl-tirpc.patch
#   patch -p1 < ../gdl-updates.patch
    patch -Np1 -l -i "${srcdir}/gdl-python3.patch"
    patch -Np1 -i "${srcdir}/gdl-graphicsmagick.patch"
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=ON -DPYTHONVERSION=3 \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_MODULE=ON \
        -DGRAPHICSMAGICK=ON -DMAGICK=OFF -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DHDF5=ON -DGRIB=ON -DUDUNITS=ON -DEIGEN3=ON \
        -DNETCDF=ON -DREADLINE=ON -DEDITLINE=OFF ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    if [[ -d ../pkginstall ]]; then
        rm -r ../pkginstall
    fi
    mkdir ../pkginstall
    make DESTDIR=../pkginstall install

    install -D -m755 -t "${pkgdir}/usr/lib/python${_pyver}/site-packages" ../pkginstall/usr/lib/python"${_pyver}"/site-packages/GDL.so
    install -m755 -t "${pkgdir}/usr/lib" ../pkginstall/usr/lib/libantlr.so
    install -D -m644 -t "${pkgdir}/usr/share/doc/gnudatalanguage" ../PYTHON.txt
}
