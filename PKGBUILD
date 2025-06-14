# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: jyantis <yantis@yantis.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

set -u
pkgbase=poppler
pkgbase+='-git'
pkgname=('poppler' 'poppler-glib' 'poppler-qt5' 'poppler-qt6')
pkgver=25.06.0.r18.g12597a17
pkgrel=1
arch=(x86_64)
arch+=('i686' 'aarch64')
license=('GPL-2.0-only'
         'GPL-3.0-or-later'
         'LGPL-2.0-or-later'
         'LGPL-2.1-or-later'
         'MIT'
         'HPND-sell-variant')
makedepends=('libjpeg-turbo' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2'
             'gtk3' 'pkgconfig' 'lcms2' 'gobject-introspection' 'icu'
             'qt5-base' 'qt6-base' 'git' 'nss' 'gpgmepp' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python' 'boost' 'glib2-devel')
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
# https://gitlab.freedesktop.org/poppler/poppler
source=(https://poppler.freedesktop.org/${pkgbase}-${pkgver}.tar.xz{,.sig}
        test::git+https://gitlab.freedesktop.org/poppler/test.git#commit=c79c6839e859dbee6b73ac260788fa2de8618ba4
)
md5sums=('ea6661d4c3b29593f861255aab1f8324'
         'SKIP'
         'b706a5e0a3bd54df27e8aae21c6d7143')
sha256sums=('8199532d38984fab46dbd0020ec9c40f20e928e33e9b4cc6043572603a821d83'
            'SKIP'
            'b33c91e6f5ae8539f55b79a5b0ce27a51702fa45957c0a3a4dd695f7dcc497d7')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

if [ "${pkgbase%-git}" != "${pkgbase}" ]; then
  _srcdir="${pkgbase%-git}"
  pkgname=("${pkgname[@]/%/-git}")
  source[0]='git+https://gitlab.freedesktop.org/poppler/poppler.git/'
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  source[2]='test::git+https://gitlab.freedesktop.org/poppler/test.git'
  md5sums[2]='SKIP'
  sha256sums[2]='SKIP'
  unset source[1];     source=("${source[@]}")
  unset md5sums[1];    md5sums=("${md5sums[@]}")
  unset sha256sums[1]; sha256sums=("${sha256sums[@]}")
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^poppler\.::g'
  set +u
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
  source=("${source[@]/${pkgver}/${pkgver%.r*}}")
pkgver() {
  set -u
  printf '%s\n' "${pkgver%.r*}"
  set +u
}
fi

build() {
  set -u
if [ ! -d 'build' ]; then
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=ON
fi
  set +u
  cmake --build build
}

check() {
  LANG=en_US.UTF8 ctest --test-dir build --output-on-failure
}

package_poppler() {
  set -u
  pkgdesc="PDF rendering library based on xpdf 3.0"
  depends=('libjpeg-turbo' 'gcc-libs' 'cairo' 'fontconfig'
           'openjpeg2' 'lcms2' 'nss' 'curl' 'gpgmepp'
           'nspr' 'libpng' 'freetype2' 'zlib' 'libtiff' 'glibc')
  optdepends=('poppler-data: highly recommended encoding data to display PDF documents with certain encodings and characters')
  provides=('libpoppler.so' 'libpoppler-cpp.so')
  conflicts=("poppler-qt3<${pkgver}" "poppler-qt4<${pkgver}")
  ___conflicts+=('poppler')
  ___provides+=("poppler=${pkgver}")

  DESTDIR="$pkgdir" cmake --install build

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt5,qt6}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt5,qt6}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt5,qt6}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
  set +u
}

package_poppler-glib() {
  set -u
  pkgdesc="Poppler glib bindings"
  depends=("poppler=${pkgver}" 'glib2' 'gcc-libs' 'freetype2' 'cairo' 'glibc')
  provides=('libpoppler-glib.so')
  ___provides+=("poppler-glib=${pkgver}")
  ___conflicts=('poppler-glib')

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -vf "${pkgdir}"/usr/lib/libpoppler.*
  rm -vf "${pkgdir}/usr/bin/poppler-glib-demo"

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgbase}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
  set -u
}

package_poppler-qt5() {
  set -u
  pkgdesc="Poppler Qt5 bindings"
  depends=("poppler=${pkgver}" 'qt5-base' 'lcms2' 'freetype2' 'gcc-libs' 'glibc')
  provides=('libpoppler-qt5.so')
  ___provides+=("poppler-qt5=${pkgver}")
  ___conflicts=('poppler-qt5')

  cd build
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgbase}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
  set +u
}

package_poppler-qt6() {
  set -u
  pkgdesc="Poppler Qt6 bindings"
  depends=("poppler=${pkgver}" 'qt6-base' 'lcms2' 'freetype2' 'gcc-libs' 'glibc')
  provides=('libpoppler-qt6.so')
  ___provides+=("poppler-qt6=${pkgver}")
  ___conflicts=('poppler-qt6')

  cd build
  make -C qt6 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt6.pc "${pkgdir}/usr/lib/pkgconfig/"

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgbase}-${pkgver}/{COPYING,COPYING3,README-XPDF,README.contributors} "${pkgdir}"/usr/share/licenses/${pkgname}/
  set +u
}

_fn_pkggit() {
  if [ "${pkgbase%-git}" != "${pkgbase}" ]; then
    local _p _f _s _r
    for _p in "${pkgname[@]%-git}"; do
      #eval "package_${_p}-git() { package_${_p} \"\$@\"; }" # not makepkg --printsrcinfo compatible
      _f="$(declare -f "package_${_p}")"
      _s="package_${_p}";        _r="${_s}-git";      _f="${_f/${_s}/${_r}}"
      _s=' ___';                 _r=' ';              _f="${_f//${_s}/${_r}}"
      _s='${pkgbase}-${pkgver}'; _r='${_srcdir}';     _f="${_f//${_s}/${_r}}"
      _s='${pkgname}-${pkgver}'; _r='${_srcdir}';     _f="${_f//${_s}/${_r}}"
      _s='${pkgver}';            _r='${pkgver%%.r*}'; _f="${_f//${_s}/${_r}}"
      eval "${_f}" #; declare -f "package_${_p}-git" 1>&2
    done
    _f="$(declare -f "build")"
    _s='$pkgname-$pkgver';         _r='${_srcdir}';     _f="${_f/${_s}/${_r}}"
    eval "${_f}" #; declare -f 'build' 1>&2
  fi
}
_fn_pkggit
set +u
