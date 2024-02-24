# Maintainer: SpacingBat3 <git@spacingbat3.anonaddy.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

_srcname=manaverse
_vcs=git
_feat=('sdl2')
pkgbase=$_srcname-$_vcs
pkgname=("${_srcname}-${_vcs}" "${_feat[@]/*/${_srcname}-&-${_vcs}}")
pkgver=1.0r12831.f4ecfac
pkgrel=1
pkgdesc="A ManaPlus fork and official game client for The Mana World."
arch=('x86_64')
url="https://manaplus.org/"
license=('GPL')
depends=('glu' 'libxml2' 'physfs' 'curl')
makedepends=('mesa'  'sdl'{,'2'}_{'image','mixer','net','ttf','gfx'})
optdepends=('xdg-utils: open in-game urls in browser')
provides=("$_srcname=$pkgver" 'manaplus')
conflicts=("$_srcname" 'manaplus')
replaces=('tmw')
source=($_srcname::$_vcs+'https://git.themanaworld.org/mana/plus.git/'
        'fix-various-compiler-errors.patch')
sha512sums=('SKIP'
            '7ec1dc4d812a235f59aee0ec299b156169a7a0c17b791fc8a2fcfc7d040258755789930fad792526134c88782a099e64422ad8b6f6ee46b299c593def9b1a15c')
b2sums=('SKIP'
        'b422dd920aa3acbee81360608a6381547a3911ebe0c410a6997639ad047e8cd5284e179210d9337c5641f21d2e0c9d20dbe671f644c3bac45d560871ca2da9d2')

pkgver() {
  cd $_srcname
  # format: [app_ver]r[git_rev_count].[git_rev_hash]
  printf "%sr%s.%s" \
    "$(grep 'AC_INIT' 'configure.ac' | sed -E 's/^AC_INIT\(\[[^]]*\], \[([^]]*)\].*/\1/')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_srcname
  git reset --hard
  git clean -fx
  git apply "${srcdir}/${source[1]}"
  # Rebrand to ManaVerse in more places
  sed -i 's/\[ManaPlus\]/\[ManaVerse\]/;s/\[manaplus\]/\[manaverse\]/' 'configure.ac'
  sed -E -i \
  	's/^(#define PACKAGE_EXTENDED_VERSION ")ManaPlus/\1ManaVerse/;s/(#define FULL_VERSION ")ManaPlus/\1ManaVerse/' \
  	'src/main.h'
  sed -i 's/ManaPlus/ManaVerse/g' 'manaplus'{,'test'}'.desktop'
  autoreconf -i
}

_build() {
  local _lfeat _dist _args;
  _lfeat=""
  _args=()
  if [ -n "$1" ]; then
  	_lfeat="-$1"
  	_args+=(--with"$_lfeat")
  fi
  ./configure --prefix=/usr "${_args[@]}"
  make
  for _dist in manaplus dyecmd; do
  	mv -f src/$_dist src/$_dist"$_lfeat".bak
  done
}

_package() {
  local _lfeat _dist;
  [ -n "$1" ] && _lfeat="-$1" || _lfeat=""
  for _dist in manaplus dyecmd; do
  	cp -f src/$_dist"$_lfeat".bak src/$_dist
  done
  make DESTDIR="${pkgdir}" install
}

build() {
  cd $_srcname
  # SDL1.2 variant
  _build
  make clean
  # SDL2 variant
  _build sdl2
}

package_manaverse-sdl2-git() {
  depends+=('sdl2_'{'image','mixer','net','ttf','gfx'})
  pkgdesc+=" SDL2 version."
  cd $_srcname
  _package sdl2
}

package_manaverse-git() {
  depends+=('sdl_'{'image','mixer','net','ttf','gfx'})
  cd $_srcname
  _package
}
