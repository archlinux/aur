# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name="poppler"
pkgbase="lib32-${_name}"
pkgname=("${pkgbase}"{,'-glib'}) # ,'qt'{'5','6'}
pkgver=25.05.0
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
        "test::git+https://gitlab.freedesktop.org/poppler/test.git#commit=91ee031c882634c36f2f0f2f14eb6646dd542fb9")
sha256sums=('9b1627c5b76816ac5e4052a03f5b605ba40b45cf06b02cadd0479620b499ab38'
            'SKIP'
            '2f797eea1e904012d3c2d1c69ed92ac51e444bf7934447945fedd6c749fef4f2')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='Release'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='/usr/lib32'
    -D ENABLE_UNSTABLE_API_ABI_HEADERS:BOOL=ON
    -D ENABLE_UTILS:BOOL=OFF
    -D ENABLE_GOBJECT_INTROSPECTION:BOOL=OFF
    -D ENABLE_GTK_DOC:BOOL=OFF
    -D ENABLE_GPGME:BOOL=OFF
    -D ENABLE_QT6:BOOL=OFF
    -D ENABLE_QT5:BOOL=OFF
    -D INSTALL_GLIB_DEMO:BOOL=OFF
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
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
  find . -type f,l -name '*glib*' -delete
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
  find . -type f,l ! -name '*glib*' -delete
}

