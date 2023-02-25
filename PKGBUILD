# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

# Set this variable to anything to disable translations.
# Or specify the two-letter language code of the translation you wish to keep.
_localepurge=

_pkgname=sigil
pkgname="$_pkgname-git"
pkgver=1.9.20.r46.ga2898308c
pkgrel=1
pkgdesc='multi-platform EPUB2/EPUB3 ebook editor'
arch=('x86_64')
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL3')
depends=(
  'hunspell'
  'qt5-webengine'
)
makedepends=(
  'cmake'
  'git'
  'python'
  'qt5-tools'
)
optdepends=(
  'hyphen-en: for English hyphenation support in plugins'
  'pageedit: external editor to replace BookView'
  'python-chardet: recommended for plugins'
  'python-cssselect: recommended for plugins'
  'python-pillow: recommended for plugins'
  'python-pyqt5-webengine: recommended for plugins'
  'python-pyqt5: recommended for plugins'
  'python-regex: recommended for plugins'
  'tk: recommended for plugins'
)

provides=("$_pkgname")
conflicts=(${provides[@]})
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

  for p in "$srcdir"/*.patch ; do
    patch -Np1 -i "$p"
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
  mkdir -p "$srcdir/$_pkgname/build"
  cd "$srcdir/$_pkgname/build"

  cmake -G "Unix Makefiles" \
    -DUSE_SYSTEM_LIBS=1 \
    -DSYSTEM_LIBS_REQUIRED=1 \
    -DINSTALL_BUNDLED_DICTS=0 \
    -DINSTALL_HICOLOR_ICONS=1 \
    -DDISABLE_UPDATE_CHECK=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_FLAGS:STRING="$CFLAGS" \
    -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  depends+=(
    'python-cchardet'
    'python-certifi'
    'python-css-parser'
    'python-dulwich'
    'python-html5lib'
    'python-lxml'
  )

  cd "$srcdir/$_pkgname/build"
  make install DESTDIR="$pkgdir"

  # Compile python bytecode
  python -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
  python -O -m compileall "$pkgdir/usr/share/sigil/"{plugin_launchers/python/,python3lib}
}
