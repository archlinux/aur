# Maintainer: xiota / aur.chaotic.cx
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

## options
# set to two letter code of language to keep
: ${_localepurge=}

: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname=sigil
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.0.2.r50.gd3016cd17
pkgrel=1
pkgdesc='multi-platform EPUB2/EPUB3 ebook editor'
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL-3.0-or-later')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    'hicolor-icon-theme'
    'hunspell'
    'mathjax'
    'minizip'
    'python-css-parser'
    'python-dulwich'
    'python-lxml'
    'qt6-5compat'
    'qt6-svg'
    'qt6-webengine'
  )
  makedepends=(
    'cmake'
    'git'
    'qt6-tools'
  )
  optdepends=(
    'hunspell-en_US: for English dictionary support'
    'hyphen-en: for English hyphenation support in plugins'
    'pageedit: external editor to replace BookView'
    'pyside6: recommended for plugins'
    'python-chardet: recommended for plugins'
    'python-cssselect: recommended for plugins'
    'python-html5lib: recommended for plugins'
    'python-pillow: recommended for plugins'
    'python-regex: recommended for plugins'
    'tk: recommended for plugins'
  )

  options=(!debug)

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  _source_patches
}

_source_patches() {
  source+=(
    '0001-modify-default-navigation-css.patch'
    '0002-skip-epub-version-check.patch'
    '0003-don-t-write-version-and-modified-tags.patch'
  )

  sha256sums+=(
    '157504daff4a410fc14cbe78820940b27e6790e5cd723f1764ca78134630dbee'
    '7d213fa2b5eae33723b1e1a17f0ed28a518e9edcc0496e2a67afc8d0e5cb36e3'
    '820e012907c70260af2cc2be6d1697037e1527f346727f3b4378ea215038b0d6'
  )

  _prepare_patches() (
    cd "${srcdir:?}/$_pkgsrc"
    apply-patch "${srcdir:?}/0001-modify-default-navigation-css.patch"
    apply-patch "${srcdir:?}/0002-skip-epub-version-check.patch"
    apply-patch "${srcdir:?}/0003-don-t-write-version-and-modified-tags.patch"
  )
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    local _pkgver="${pkgver%%.r*}"
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    cd "$_pkgsrc"
    local _pkgver=$(
      git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
        | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    )

    echo "${_pkgver:?}"
  )
}

# common funtions
prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  _prepare_patches

  cd "$_pkgsrc"
  # Set _localepurge to disable or keep translations.
  # Specify the two-letter language code of the translation to keep.
  # If language does not exist, all languages will be purged.
  if [[ "${_localepurge}" != "" ]]; then
    for trans in src/Resource_Files/ts/*; do
      if [[ "$(basename $trans | sed -r 's/(_.*)_.*/\1/g')" != "sigil_${_localepurge}" ]]; then
        rm $trans
      fi
    done
  fi
}

build() {
  local _cmake_config=(
    -B build
    -S "$_pkgname"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DMATHJAX3_DIR='/usr/share/mathjax'
    -DSYSTEM_LIBS_REQUIRED=1
    -DUSE_SYSTEM_LIBS=1
    -DDISABLE_UPDATE_CHECK=1
    -DINSTALL_BUNDLED_DICTS=0
    -DINSTALL_HICOLOR_ICONS=1
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
    -DCMAKE_C_FLAGS="$CFLAGS"
    -DCMAKE_SKIP_RPATH=ON
  )

  cmake "${_cmake_config[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build

  # Compile python bytecode
  python -m compileall "${pkgdir:?}/usr/share/sigil/"{plugin_launchers/python/,python3lib}
  python -O -m compileall "${pkgdir:?}/usr/share/sigil/"{plugin_launchers/python/,python3lib}
}

# execute
_main_package
