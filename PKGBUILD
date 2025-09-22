# Maintainer: SpacingBat3 <git@spacingbat3.anonaddy.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

# shellcheck shell=bash disable=SC2164,SC2034,SC2154

_srcname=manaverse
_vcs=git
_feat=('sdl2')
pkgbase=$_srcname-$_vcs
pkgname=("${_srcname}-${_vcs}" "${_feat[@]/*/${_srcname}-&-${_vcs}}")
pkgver=1.0r13075.655bf6d
pkgrel=1
pkgdesc="A ManaPlus fork and official game client for The Mana World."
arch=('x86_64')
url="https://manaplus.germantmw.de/"
license=('GPL-2.0-or-later')
depends=('glu' 'libxml2' 'physfs' 'curl')
makedepends=("$_vcs" 'mesa'  'sdl'{,'2'}_{'image','mixer','net','ttf','gfx'})
optdepends=('xdg-utils: open in-game urls in browser')
provides=("$_srcname=$pkgver")
conflicts=("$_srcname")
replaces=('tmw')
source=("$_srcname::$_vcs"+'https://git.themanaworld.org/mana/plus.git/')
sha256sums=('SKIP')

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
  # Rebrand to ManaVerse in more places
  sed -i 's/\[manaplus\]/\[manaverse\]/' 'configure.ac'
  sed -i 's/ManaPlus/ManaVerse/g;s/manaplus/manaverse/g' 'manaplus'{,'test'}'.desktop' 'docs/manaplus'{,'test'}'.6'
  sed -E -i \
    's#(<id .*>).*\\.desktop</id>#\\1manaverse.desktop</id>#' \
    'manaplus.metainfo.xml'
  autoreconf -i
}

_build() {
  local _lfeat _dist _args
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
  local _lfeat _dist _bname _rbnd
  [ -n "$1" ] && _lfeat="-$1" || _lfeat=""
  for _dist in manaplus dyecmd; do
    cp -f src/$_dist"$_lfeat".bak src/$_dist
  done
  make DESTDIR="${pkgdir}" install
  # Rename files to avoid conflicts with manaplus
  # (continuation of rebranding done in prepare())
  mv -T "${pkgdir}/usr/bin/dyecmd" "${pkgdir}/usr/bin/dyecmd_mv"
  mv -T "${pkgdir}/usr/bin/manaplus" "${pkgdir}/usr/bin/manaverse"
  for _rbnd in "${pkgdir}/usr/share/"{applications,metainfo,man/man6,icons/hicolor/scalable/apps}'/manaplus'*; do
    mv -T "$_rbnd" "${_rbnd%/*}/manaverse${_rbnd##*manaplus}"
  done
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
