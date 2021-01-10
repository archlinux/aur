# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-poppler
_pkgbase=poppler
pkgname=('lib32-poppler' 'lib32-poppler-glib')
pkgver=21.01.0
pkgrel=1
arch=(x86_64)
license=('GPL')
makedepends=('lib32-libjpeg' 'lib32-gcc-libs' 'lib32-cairo'
             'lib32-fontconfig' 'lib32-gtk3' 'lib32-lcms2'
             'gobject-introspection' 'lib32-icu' 'git' 'nss'
             'lib32-curl' 'poppler-data' 'cmake' 'python' 'boost'
             'poppler')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
source=(https://poppler.freedesktop.org/${_pkgbase}-${pkgver}.tar.xz{,.sig}
        test::git+https://anongit.freedesktop.org/git/poppler/test/#commit=03a4b9eb854a06a83c465e82de601796c458bbe9
        pkgconf32)
sha512sums=('aec130446df73a2fc66851a563a14cb40299212a2de4a0d03668b0fecb28312fffa70d0a82431c774d0c0e3f7293788bd2bdf28c8136aa09ad80edbca4cf0ddd'
            'SKIP'
            'SKIP'
            'f704e11f3054312e35974194af845e00fdc795aa97e82d425fb52ff8e628702926551b583f0354f9f9e7eafeb71c7f348c288457ff19a8c4807c58f637d0d946')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # "Albert Astals Cid <aacid@kde.org>"

prepare() {
  mkdir -p build
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
           'lib32-fontconfig' 'lib32-openjpeg2' 'lib32-lcms2'
           "poppler=${pkgver}" 'lib32-nss' 'curl')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')

  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -r "${pkgdir}/usr/"{bin,include,share}
  rm -vf "${pkgdir}"/usr/lib32/libpoppler-glib.*
  rm -vf "${pkgdir}"/usr/lib32/pkgconfig/poppler-glib.pc
  rm -vrf "${pkgdir}"/usr/lib32/gir*
}

package_lib32-poppler-glib() {
  pkgdesc="Poppler glib bindings (32-bit)"
  depends=("lib32-poppler=${pkgver}" 'lib32-glib2'
           "poppler-glib=${pkgver}")

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib32/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib32/pkgconfig/"
  rm -r "${pkgdir}/usr/include"
  rm -vf "${pkgdir}"/usr/lib32/libpoppler.*
}

