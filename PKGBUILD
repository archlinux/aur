# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-poppler
_pkgbase=poppler
pkgname=('lib32-poppler' 'lib32-poppler-glib')
pkgver=23.06.0
_commit=e3cdc82782941a8d7b8112f83b4a81b3d334601a
pkgrel=2
arch=(x86_64)
license=('GPL')
makedepends=('lib32-libjpeg' 'lib32-gcc-libs' 'lib32-cairo'
             'lib32-fontconfig' 'lib32-gtk3' 'lib32-lcms2'
             'gobject-introspection' 'lib32-icu' 'git' 'nss'
             'lib32-curl' 'poppler-data' 'cmake' 'python' 'boost'
             'poppler')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
# https://gitlab.freedesktop.org/poppler/poppler
source=(https://poppler.freedesktop.org/${_pkgbase}-${pkgver}.tar.xz{,.sig}
        fix-signature-test-failure.patch::https://gitlab.freedesktop.org/poppler/poppler/-/commit/def45c82b36ec393fbaf16d9873db23bc9659b80.patch
        test::git+https://gitlab.freedesktop.org/poppler/test.git/#commit=$_commit
        pkgconf32)
sha512sums=('4f7ac99431b4c4fccbb94080e3964fad2abde67d6c7895090cd72488c00066faf7e5d34c660ab46a63a1009bbc948660cc5db1a4cfa1bbfe78f3bf18e95415f6'
            'SKIP'
            '72da4491d6e27929cac452508e08796fc09b7a071e8c67af4bc93afb7e600555bda4adfe3023e1e1fab98805e4d3dd5741ed018608876939375e92230b59f87f'
            'SKIP'
            'f704e11f3054312e35974194af845e00fdc795aa97e82d425fb52ff8e628702926551b583f0354f9f9e7eafeb71c7f348c288457ff19a8c4807c58f637d0d946')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # "Albert Astals Cid <aacid@kde.org>"

prepare() {
  mkdir -p build
  cd ${_pkgbase}-${pkgver}
  sed -i 's/^\(  set(ENABLE_GPGME ON)\)/#\1/' CMakeLists.txt
  # Don't fail signature basics tests if backend is not configured
  patch -Np1 -i ../fix-signature-test-failure.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export CCFLAGS="-m32 ${CCFLAGS}"
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  cd build
  cmake ../${_pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib32" \
    -DPKG_CONFIG_EXECUTABLE="$srcdir/pkgconf32" \
    -DENABLE_LIBOPENJPEG="unmaintained" \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=OFF \
    -DENABLE_GPGME=OFF \
    -DENABLE_QT5=OFF
  make
}

check() {
  cd build
  LANG=en_US.UTF8 make test
}

package_lib32-poppler() {
  pkgdesc="PDF rendering library based on xpdf 3.0 (32-bit)"
  depends=('lib32-libjpeg' 'lib32-gcc-libs' 'lib32-cairo'
           'lib32-fontconfig' 'lib32-lcms2'
           "poppler>=${pkgver}" 'lib32-nss' 'curl')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  provides=('libpoppler.so' 'libpoppler-cpp.so')

  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -vrf "${pkgdir}/usr/"{bin,include,share}
  rm -vf "${pkgdir}"/usr/lib32/libpoppler-glib.*
  rm -vf "${pkgdir}"/usr/lib32/pkgconfig/poppler-glib.pc
  rm -vrf "${pkgdir}"/usr/lib32/gir*
}

package_lib32-poppler-glib() {
  pkgdesc="Poppler glib bindings (32-bit)"
  depends=("lib32-poppler=${pkgver}" 'lib32-glib2'
           "poppler-glib>=${pkgver}")
  provides=('libpoppler-glib.so')

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib32/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib32/pkgconfig/"
  rm -vrf "${pkgdir}/usr/"{include,share}
  rm -vf "${pkgdir}"/usr/lib32/libpoppler.*
}

