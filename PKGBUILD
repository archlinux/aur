# Maintainer: Astro Benzene <miguel@archlinux.net>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=python-gdl
pkgver=1.0.0_rc.3
pkgrel=2
pkgdesc="Python interface for the GNU Data Language(GDL)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net"
license=('GPL')
depends=("gnudatalanguage=${pkgver}")
makedepends=('cmake')
#options=('!makeflags')
conflicts=('python2-gdl')
source=("https://github.com/gnudatalanguage/gdl/archive/v${pkgver/_/-}.tar.gz"
        'gdl.profile'
        'gdl-mallinfo2.patch'
        'gdl-tiff.patch')
md5sums=('a6dbcbf5eaf7bb27440fdb69b84d38d7'
         '40aa5fd8278cd8e80425c62a577563cc'
         'ae546f1cb8f775dfc8589f656bdaf40a'
         'e3270e6d366670a10947e4199c7bc35a')

prepare() {
    cd ${srcdir}/gdl-${pkgver/_/-}

#   patch -p1 < ../gdl-tirpc.patch
#   patch -p1 < ../gdl-updates.patch
    patch -p1 -l -N -i "${srcdir}"/gdl-mallinfo2.patch
    patch -p1 -l -N -i "${srcdir}"/gdl-tiff.patch
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/gdl-${pkgver/_/-}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=ON -DPYTHONVERSION=3 \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_MODULE=ON \
        -DGRAPHICSMAGICK=ON -DMAGICK=OFF -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DHDF5=ON -DGRIB=ON -DUDUNITS2=ON -DEIGEN3=ON \
        -DNETCDF=ON -DREADLINE=ON -DLIBPROJ4=OFF -DGLPK=ON -DSHAPELIB=ON ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver/_/-}/build
    if [[ -d ../pkginstall ]]; then
        rm -r ../pkginstall
    fi
    mkdir ../pkginstall
    make DESTDIR=../pkginstall install

    install -D -m755 -t "${pkgdir}/usr/lib/python${_pyver}/site-packages" ../pkginstall/usr/lib/python"${_pyver}"/site-packages/GDL.so
    install -m755 -t "${pkgdir}/usr/lib" ../pkginstall/usr/lib/libantlr.so
    install -D -m644 -t "${pkgdir}/usr/share/doc/gnudatalanguage" ../PYTHON.txt
}
