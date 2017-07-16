# Maintainer: BurhanDanger <mmr.burhan at gmail dot com>
# Contributor: BurhanDanger <mmr.burhan at gmail dot com>
# Also Check GUIDE.txt

pkgname=st-patched-git
_pkgname=st
pkgver=20170712.8dacdfb
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X with patches and easy configurable colorscheme'
arch=('i686' 'x86_64')
url='http://st.suckless.org/'
license=('MIT')
options=('zipman')
depends=('libxft' 'xorg-fonts-misc')
makedepends=('ncurses' 'libxext' 'git')
optdepends=('dmenu: for unicode input')

_patches=(
    "http://st.suckless.org/patches/st-vertcenter-20170601-5a10aca.diff"
    "http://st.suckless.org/patches/st-hidecursor-20170404-745c40f.diff"
    "st-alpha-20170715.diff"
    "st-extra-config-20170715.diff"
    "st-fix-keyboard-input-20170715.diff"
    "colorscheme.h"
)

source=("git://git.suckless.org/st"
    "${_patches[@]}")
    
md5sums=('SKIP'
         '350f621526473654bcd8ddc9907959da'
         '487dc42b84ea464474aac527c2b47191'
         'cea5e8189b4a6690f65e0c4eff3dd7a8'
         '7d661aeb9000bf8862a6f849c57838e2'
         '64b3a7008a25d0b865507e9388593dc7'
         '2f855a6a8f222d41b16f22878c6abec3')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  local file
  cd "${_pkgname}"

  # skip terminfo which conflicts with nsurses
  sed -i '/tic /,+1d' Makefile

  for file in "${_patches[@]}"; do
    if [[ "$file" == *.h ]]; then
      cp "$srcdir/$file" .
    elif [[ "$file" == *.diff || "$file" == *.patch ]]; then
      echo "Applying patch $(basename $file)..."
      patch -Np1 <"$srcdir/$(basename ${file})"
    fi
  done
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:ts=2 sw=2 et
