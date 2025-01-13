# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name="poppler"
pkgbase="lib32-${_name}"
pkgname=("${pkgbase}"{,'-glib'}) # ,'qt'{'5','6'}
pkgver=25.01.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (32-bit)"
arch=('x86_64')
url="https://poppler.freedesktop.org"
# _url="https://gitlab.freedesktop.org/${_name}/${_name}"
license=('GPL-2.0-only' 'GPL-3.0-or-later' 'HPND-sell-variant' 'LGPL-2.0-or-later'
         'LGPL-2.1-or-later' 'MIT')
depends=('lib32-freetype2>=2.11' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('boost' 'cmake>=3.22' 'git' 'glib2-devel' 'lib32-cairo>=1.16'
             'lib32-curl>=7.81' 'lib32-fontconfig>=2.13' 'lib32-glib2>=2.72'
             'lib32-lcms2' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libtiff>=4.3'
             'lib32-nspr' 'lib32-nss>=3.68' 'lib32-openjpeg2'
             "${_name}"{,'-glib'}">=${pkgver}")
             # 'gobject-introspection' 'lib32-gdk-pixbuf2>=2.40' 'lib32-gtk3>=3.24' 
             # 'lib32-icu' 'poppler-data' 'python')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::${url}/${_pkgsrc}.tar.xz"
        "${_pkgsrc}.tar.xz.sig::${url}/${_pkgsrc}.tar.xz.sig"
        "test::git+https://gitlab.freedesktop.org/poppler/test.git#commit=ff3133cdb6cb496ee1d2c3231bfa35006a5e8410"
        "pkgconf32")
sha256sums=('7eefc122207bbbd72a303c5e0743f4941e8ae861e24dcf0501e18ce1d1414112'
            'SKIP'
            '0efc9bd1797f0f0dfa514d4109e82c99d7e98c3e95587c70945508493074fcdf'
            '50ec8985108eb6165a401beddcff0e2fe09c9986bcf219688bd14b5f4cef8ffa')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib32' \
    -DPKG_CONFIG_EXECUTABLE="${srcdir}/pkgconf32" \
    -DENABLE_UNSTABLE_API_ABI_HEADERS:BOOL=ON \
    -DENABLE_GTK_DOC:BOOL=OFF \
    -DENABLE_GPGME:BOOL=OFF \
    -DENABLE_QT6:BOOL=OFF \
    -DENABLE_QT5:BOOL=OFF
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "${excluded_tests}"
  )
  LANG=en_US.UTF8 ctest "${ctest_flags[@]}"
}

package_lib32-poppler() {
  depends+=('lib32-curl>=7.81' 'lib32-fontconfig>=2.13' 'lib32-lcms2'
            'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libtiff>=4.3'
            'lib32-nspr' 'lib32-nss>=3.68' 'lib32-openjpeg2' 'lib32-zlib'
            "${_name}>=${pkgver}")
  # optdepends=('poppler-data: highly recommended encoding data to display PDF documents with certain encodings and characters')
  provides=("lib${_name}"{,'-cpp'}'.so')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  cd "lib32"
  rm -rf *glib* *gir*

  cd "pkgconfig"
  rm -f *glib*
}

package_lib32-poppler-glib() {
  pkgdesc="Poppler glib bindings (32-bit)"
  depends+=('lib32-cairo>=1.16' 'lib32-glib2>=2.72' "lib32-${_name}=${pkgver}"
            "${_name}-glib>=${pkgver}")
  provides=("lib${_name}-glib.so")

  cd "${srcdir}"
  # DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/glib"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  cd "lib32"
  rm -rf "lib${_name}.so"* *cpp* *gir*

  cd "pkgconfig"
  rm -f "${_name}.pc"* *cpp*
}

