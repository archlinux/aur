# Maintainer:
# Contributor: Allonsy <linuxbash8@gmail.com>

## links
# https://sourceforge.net/projects/gtktiemu
# http://lpg.ticalc.org/prj_tiemu
# https://github.com/debrouxl/tiemu

# 75fd9f4da = 3.04
: ${_commit:=2b8df9280d2054e11ffcf7e57a73899b3ce7a7e5} # 3.04.r26

_pkgname="tiemu"
pkgname="$_pkgname"
pkgver=3.04
pkgrel=1
pkgdesc="Emulator of TI-89/92/92+/V200 calculators"
url="https://github.com/debrouxl/tiemu"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'libglade'
  'libticalcs'
  'sdl12-compat'
)
makedepends=(
  'git'
)

options=('!libtool')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#commit=$_commit"
  'sysdeps.patch'
)

sha256sums=(
  'SKIP'
  'e5270440115bfbba6721d44b8e5a0fca295a8c02c724b07cff717ab887b6cfc8'
)

prepare() {
  cd "$_pkgsrc/$_pkgname/trunk"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  cd "$_pkgsrc/$_pkgname/trunk"
  ./configure --without-kde --disable-gdb --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc/$_pkgname/trunk"
  make install prefix="$pkgdir/usr"
}
