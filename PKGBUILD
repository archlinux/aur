# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>
# Contributor: Edward Noname <edward.81@gmail.com>
# Contributor: Brett McGruddy <braxs69@gmail.com>
# Contributor: Alex <antianno52@gmail.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=libgaminggear
pkgver=0.15.1
pkgrel=10
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7' 'python')
makedepends=('cmake>=3.0' 'doxygen' 'harfbuzz' 'glib2-devel')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2
        harfbuzz-headers.patch
	cmake_min_version.patch)
sha512sums=('a6635a74557f276ab65eda4610ba8a053fedf10f9d898a1dc875082a36b2822544f61fc7a274691673670b12d4de968aa4921d102a588f3d0777397730082990'
            'be38e9b5ee04e2425548e532b219c27f12345c5ed0c7b7e3082d2f5e5990ecf12e84daef8fa71289826f841fd57901898957f05d7da92de9b389ab2c4d2acdc0'
            'dac8005153801798cabc56453656adb0dc3438f87a0516852dc447116f89871446ccd1b1389b3062deadcebc337f143c7659d22dd4fd63d00055efedf25bf124')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/harfbuzz-headers.patch"
    patch -p1 -i "${srcdir}/cmake_min_version.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake . \
        -DINSTALL_CMAKE_MODULESDIR="/usr/share/libgaminggear/cmake/Modules" \
        -DCMAKE_C_FLAGS="$(pkg-config --cflags harfbuzz)" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DINSTALL_LIBDIR="/usr/lib" \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR="${pkgdir}" install
}
