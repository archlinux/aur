# Maintainer: vit01 (vitirk) <me at ii-net dot tk>
# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage-gdlkernel
pkgver=1.0.0_rc.3
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible compiler (prepared for gdl_kernel)"
arch=('i686' 'x86_64')
url="https://github.com/gnudatalanguage/gdl"
conflicts=('gnudatalanguage')
provides=('gnudatalanguage')
license=('GPL')
depends=('python'
         'python-numpy'
         'plplot'
         'glpk'
         'shapelib'
         'gsl'
         'readline'
         'hdf4'
         'hdf5'
         'netcdf'
         'netcdf-cxx'
         'wxgtk'
         'fftw'
         'pslib'
         'eccodes-git'
         'udunits'
         'eigen-git'
         'libtirpc'
         'libmagick6'
         'libgeotiff')
makedepends=('cmake')
#options=('!makeflags')
source=("https://github.com/gnudatalanguage/gdl/archive/v1.0.0-rc.3.tar.gz"
        'gdl.profile'
        'cmake-patch.patch'
)
sha512sums=(
'3fde22c7e709b9cdc72a23d2317c043037379c7903418211a699c7e5caa2ed17e78e32e6d2f9b4aa89200e729fc21555821140dfdd58a5a636a858e2841f6335'
'b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f'
'cccdef1dcb1a4f1db51f45d02a6aa9e377cf54ca058eae0d858ba12db3060b4f36d621574aabff5b8ab07f933f54bd7700d05383b3be597951cabba19186380d'
)

prepare() {
    patch -R ${srcdir}/gdl-1.0.0-rc.3/CMakeLists.txt cmake-patch.patch
}

build() {
    cd ${srcdir}/gdl-1.0.0-rc.3
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DHDF5=NO \
        -DHDFDIR=/opt/hdf4 \
        -DFFTW=YES \
        -DLIBPROJ4=YES \
        -DGRAPHICSMAGICK=ON -DMAGICK=ON \
        -DGLPK=YES \
        -DPYTHON=YES \
        -DPYTHONVERSION=3 \
        -DPYTHON_MODULE=NO \
        -DWXWIDGETS=YES \
        -DGRIB=YES \
        -DQHULL=YES \
        -DUDUNITS=YES \
        -DPSLIB=YES ..

    make -j3
}

package() {
    cd ${srcdir}/gdl-1.0.0-rc.3/build
    make DESTDIR=${pkgdir} install

    install -D -m755 ${srcdir}/gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
}
