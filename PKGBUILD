# Maintainer: Astro Benzene <miguel@archlinux.net>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=python2-gdl
pkgver=0.9.8
pkgrel=1
pkgdesc="Python interface for the GNU Data Language(GDL)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=("gnudatalanguage=${pkgver}")
makedepends=('cmake')
options=('!makeflags')
source=("http://downloads.sourceforge.net/gnudatalanguage/gdl-${pkgver}.tgz"
        'gdl-tirpc.patch'
#       'gdl-python3.patch'
        'gdl.profile')
md5sums=('451532f1263bbaa8745a4ca8978533c0'
         'cad6430a812e906ee7f1e15b4589dcac'
#        '9f85693d9fc9e838cba1fe03ae45f7cb'
         '40aa5fd8278cd8e80425c62a577563cc')

prepare() {
    cd ${srcdir}/gdl-${pkgver}

    patch -p1 < ../gdl-tirpc.patch
  # patch -Np1 -i "${srcdir}/gdl-python3.patch"
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=2.7 \
        -DPYTHON_EXECUTABLE=/usr/bin/python2.7 -DPYTHON_MODULE=ON \
        -DGRAPHICSMAGICK=ON -DMAGICK=OFF -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DHDF5=ON -DGRIB=ON -DUDUNITS=ON ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    if [[ -d ../pkginstall ]]; then
        rm -r ../pkginstall
    fi
    mkdir ../pkginstall
    make DESTDIR=../pkginstall install

    install -D -m755 -t "${pkgdir}/usr/lib/python2.7/site-packages" ../pkginstall/usr/lib/site-python/GDL.so
    install -m755 -t "${pkgdir}/usr/lib" ../pkginstall/usr/lib/libantlr.so
    install -D -m644 -t "${pkgdir}/usr/share/doc/gnudatalanguage" ../PYTHON.txt
}
