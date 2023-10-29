# Maintainer: xiota / aur.chaotic.cx
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

# Set this variable to anything to disable translations.
# Or specify the two-letter language code of the translation you wish to keep.
_localepurge=

_pkgname=sigil
pkgname="$_pkgname-git"
pkgver=2.0.2.r11.gb9438a876
pkgrel=1
pkgdesc='multi-platform EPUB2/EPUB3 ebook editor'
arch=('x86_64')
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL3')
depends=(
  'hicolor-icon-theme'
  'hunspell'
  'mathjax'
  'minizip'
  'pcre2'
  'python-cchardet'
  'python-certifi'
  'python-chardet'
  'python-css-parser'
  'python-dulwich'
  'python-html5lib'
  'python-lxml'
  'qt6-5compat'
  'qt6-webengine'
)
makedepends=(
  'cmake'
  'git'
  'python'
  'qt6-tools'
)
optdepends=(
  'hunspell-en_US: for English dictionary support'
  'hyphen-en: for English hyphenation support in plugins'
  'pageedit: external editor to replace BookView'
  'python-cssselect: recommended for plugins'
  'python-pillow: recommended for plugins'
  'python-pyqt6-webengine: recommended for plugins'
  'python-pyqt6: recommended for plugins'
  'python-regex: recommended for plugins'
  'tk: recommended for plugins'
)


if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

options=(!debug)

source+=(
  '0001-modify-default-navigation-css.patch'
  '0002-skip-epub-version-check.patch'
  '0003-don-t-write-version-and-modified-tags.patch'
)

sha256sums+=(
  'c01f2028fd2a77fa48ddeefc70b780d185131f81c8c3b3f4f3bfd670cd1d574f'
  'd06138d38a2d29ca020ec575bd2aa975df48cf61bbad975140fe5f304e23f6b0'
  '4bddaaf8666e3d060ba51989c94d6c3a2c23a5b037dd69abe6c61af51b580720'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  if [[ "${_localepurge}" != "" ]]; then
    for trans in src/Resource_Files/ts/*; do
      if [[ "$(basename $trans | sed -r 's/(_.*)_.*/\1/g')" != "sigil_${_localepurge}" ]]; then
        rm $trans
      fi
    done
  fi
}

build() {
  cmake -G "Unix Makefiles" \
    -B build \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DMATHJAX3_DIR='/usr/share/mathjax' \
    -DUSE_QT6=1 \
    -DUSE_SYSTEM_LIBS=1 \
    -DSYSTEM_LIBS_REQUIRED=1 \
    -DINSTALL_BUNDLED_DICTS=0 \
    -DINSTALL_HICOLOR_ICONS=1 \
    -DDISABLE_UPDATE_CHECK=1 \
    -DCMAKE_C_FLAGS:STRING="$CFLAGS" \
    -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -DCMAKE_SKIP_RPATH=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Compile python bytecode
  python -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
  python -O -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
}
