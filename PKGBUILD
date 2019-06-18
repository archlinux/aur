# Maintainer: BurhanDanger <mmr.burhan at gmail dot com>
# Contributor: BurhanDanger <mmr.burhan at gmail dot com>
# Also Check GUIDE.txt

pkgname=st-patched-git
_pkgname=st
pkgver=0.8.2.r13.gcaa1d8f
pkgrel=2
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
    "https://st.suckless.org/patches/anysize/st-anysize-0.8.1.diff"
    "st-blinking-cursor-20180605.diff"
    "st-boxdraw_v2-0.8.2.diff"
    "st-hidecursor-0.8.1.diff"
    "st-vertcenter-20180320-6ac8c8a.diff"
    "st-xresources-20190105-3be4cf1.diff"
    "st-alpha-20190618.diff"              # Modified for compatibility
    "st-extra-config-20190618.diff"       # Modified for compatibility
    "colorscheme.h"                       # Modified for compatibility
)

source=("git://git.suckless.org/st"
    "${_patches[@]}")
    
md5sums=('SKIP'
         '9effc30b79e07c3dc9d2a1e41b9dd6d1'
         'bd291b0947263c56ae3504c989c64f12'
         '00c12113227c95cdcc2fdce01ef58780'
         '7b6f4a1efe7987b8f5554b4ec16082f9'
         '51106ec8ff04d64029401421bbc57ab5'
         '11e28f38988de5141bfdf0da8cbfde8a'
         'b5476e67b47668833412295d76f31bab'
         'ea6926266fc2eb9bc86478d90a9096e3'
         '8f858ab6c8b80c983e0315f4ba6d5dbc')

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
