# Maintainer: BurhanDanger <mmr.burhan at gmail dot com>
# Contributor: BurhanDanger <mmr.burhan at gmail dot com>
# Also Check GUIDE.txt

pkgname=st-patched-git
_pkgname=st
pkgver=0.8.1.r3.g041912a
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X with patches and easy configurable colorscheme'
arch=('i686' 'x86_64')
url='https://st.suckless.org/'
license=('MIT')
options=('zipman')
depends=('libxft' 'xorg-fonts-misc')
makedepends=('ncurses' 'libxext' 'git')
optdepends=('dmenu: for unicode input'
            'otf-fantasque-sans-mono: default defined font' )

_patches=(
    "https://st.suckless.org/patches/vertcenter/st-vertcenter-20180320-6ac8c8a.diff"
    "https://st.suckless.org/patches/hidecursor/st-hidecursor-0.8.diff"
    "st-extra-config-20180420.diff"
    "st-fix-keyboard-input-20180420.txt"
    "colorscheme.h"
)

source=("git://git.suckless.org/st"
    "${_patches[@]}")
    
md5sums=('SKIP'
         '51106ec8ff04d64029401421bbc57ab5'
         '8749ced53fc11d7a979fa8fa21d66de4'
         'd8b5e709aaaea8c9e5050c26bbcb2e26'
         '67c9732a7c525525595dc35f9fc2554e'
         'c053fd06afe77a38b64050582646baf2')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
