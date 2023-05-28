# Maintainer:
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

# Set this variable to anything to disable translations.
# Or specify the two-letter language code of the translation you wish to keep.
_localepurge=

_pkgname=sigil
pkgname="$_pkgname-git"
pkgver=1.9.30.r36.g13c212079
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

provides=("$_pkgname")
conflicts=(${provides[@]})

options=(!debug)

source=(
  "$_pkgname"::"git+$url"
  'default_nav_css.patch'
  'skip_epub_version_check.patch'
  'skip_version_mod_tags.patch'
)

sha256sums=(
  'SKIP'
  '3478ff361a34fd7cd7811d5103cbace91ecc790463684aaab9e21687b5553a28'
  'fc2bdc23d13b2e917f08608b516495b744f991642f73c1f6d943cf322a25fc11'
  'c74be3af315c9ffe181df6b465d0037f152f6078b953e6eeaab7b2932ae4c729'
)

prepare() {
  cd "$srcdir/$_pkgname"

  for patch in "$srcdir"/*.patch ; do
    echo "Applying patch: $patch"
    patch -Np1 -i "$patch"
  done

  if [[ "${_localepurge}" != "" ]]; then
    for trans in src/Resource_Files/ts/*; do
      if [[ "$(basename $trans | sed -r 's/(_.*)_.*/\1/g')" != "sigil_${_localepurge}" ]]; then
        rm $trans
      fi
    done
  fi
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
