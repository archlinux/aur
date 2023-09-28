# Maintainer: Astro Benzene <miguel@archlinux.net>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>
# Contributor: Jan Kohnert <kohni.jk at gmail dot com>

pkgname=python-gdl
pkgver=1.0.3
pkgrel=1
pkgdesc="Python interface for the GNU Data Language(GDL)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net"
license=('GPL')
depends=("gnudatalanguage=${pkgver}" 'python-numpy')
makedepends=('cmake' 'eigen')
#options=('!makeflags')
conflicts=('python2-gdl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gnudatalanguage/gdl/releases/download/v${pkgver}/gdl-v${pkgver}.tar.gz"
        'gdl.profile'
        'gdl-1.0.1-fix-python-wxGetApp.patch')
md5sums=('8125987275e4bcea3736c51603427e9b'
         '40aa5fd8278cd8e80425c62a577563cc'
         'bf1e1fb364eaf92e09ad7031c0c2b546')

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/gdl-${pkgver}
#
#    patch -Np1 -i "${srcdir}/gdl-1.0.1-fix-python-wxGetApp.patch"
#}

build() {
    cd ${srcdir}/gdl
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=ON -DFFTW=ON -DGLPK=ON \
        -DGRAPHICSMAGICK=ON -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON -DNETCDF=ON -DPYTHON=ON \
        -DPYTHONVERSION=3 -DPYTHON_MODULE=ON -DQHULL=OFF -DREADLINE=ON \
        -DSHAPELIB=ON -DUDUNITS2=ON ..

    make
}

package() {
    cd ${srcdir}/gdl/build
    if [[ -d ../pkginstall ]]; then
        rm -r ../pkginstall
    fi
    mkdir ../pkginstall
    make DESTDIR=../pkginstall install

    install -D -m755 -t "${pkgdir}/$(get_pyinfo site)" ../pkginstall/$(get_pyinfo site)/GDL.so
    install -m755 -t "${pkgdir}/usr/lib" ../pkginstall/usr/lib/libantlr.so
    install -D -m644 -t "${pkgdir}/usr/share/doc/gnudatalanguage" ../PYTHON.txt
}
