# Maintainer: xiota / aur.chaotic.cx
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

_pkgname="sigil"
pkgname="$_pkgname-git"
pkgver=2.8.1.r85.gc95c2d7
pkgrel=1
pkgdesc='multi-platform EPUB2/EPUB3 ebook editor'
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'hunspell'
  'mathjax'
  'minizip'
  'python'
  'python-css-parser'
  'python-dulwich'
  'python-lxml'
  'qt6-svg'
  'qt6-webengine'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
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

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-modify-default-navigation-css.patch'
  '0002-skip-epub-version-check.patch'
  '0003-don-t-write-version-and-modified-tags.patch'
)
sha256sums=(
  'SKIP'
  'a0e980fa170d79ab4abdc6ffcc226ecbe48de0197d0e6290aef9040ff927d712'
  'b32bfa744a66123571b15f7b410cff839196d77ef24efaaf7090c6b45b126b02'
  '260433609819665b13a4b7bdd7a0de2a2a009ce396bc6d2dc74ec65b31eb6892'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' 2> /dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_config=(
    -B build
    -S "$_pkgname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCMAKE_SKIP_RPATH=ON
    -Wno-author

    -DDISABLE_UPDATE_CHECK=1
    -DINSTALL_BUNDLED_DICTS=0
    -DINSTALL_HICOLOR_ICONS=ON
    -DMATHJAX3_DIR='/usr/share/mathjax'
    -DSYSTEM_LIBS_REQUIRED=ON
    -DUSE_SYSTEM_LIBS=ON
  )

  cmake "${_cmake_config[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Compile python bytecode
  python -m compileall -o0 -o1 -f -p / -s "$pkgdir" "$pkgdir/"
}
