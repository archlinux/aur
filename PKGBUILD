# Maintainer: BurhanDanger <mmr.burhan at gmail dot com>
# Contributor: BurhanDanger <mmr.burhan at gmail dot com>
# Also Check GUIDE.txt

pkgname=st-patched
_pkgname=st
pkgver=20170603
pkgrel=1
_gitCommitNo=b331da550b290d54592b7ba11242c92f5a303a48
pkgdesc='Simple virtual terminal emulator for X with patches and easy configurable colorscheme'
arch=('i686' 'x86_64')
url='http://st.suckless.org/'
license=('MIT')
options=('zipman')
depends=('libxft' 'xorg-fonts-misc')
makedepends=('ncurses' 'libxext' 'git')
optdepends=('dmenu: for unicode input'
    'xurls:    for externalpipe url grab feature'
    'open:     for url opening in applications (perl executable)'
    'piping:    for url opening in applications(bash script)'
)
install='st-patched.install'

_patches=(
    "st-scrollback-normal-20170619.diff"
    "st-verticalcenter-20170619.diff"
    "st-hidecursor-20170619.diff"
    "st-alpha-20170619.diff"
    #"st-externalpipe-20170619.diff"
    #"st-extra-config-20170620.diff"
    "st-extra-config-NO_EXT_PIPE_20170620.diff"
    "colorscheme.h"
)

source=("git://git.suckless.org/st"
    "${_patches[@]}")
md5sums=('SKIP'
         'd96f393b7052ad014b9835504bdfb36a'
         '7005c2928e84878ac15ed380fb3f9960'
         '1e7e6b1d9cd51ef9ef8ddbe78cc1b279'
         '8161d9f6ac5c805af0b76d4a87da248c'
         '1d340d93364347031f8760a8f51f17bc'
         '128b389a3e061cd2c86486d72c99184a')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
  local file
  cd "${_pkgname}"
  git reset --hard ${_gitCommitNo}

  # skip terminfo which conflicts with nsurses
  sed -i '/\@tic /d' Makefile

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
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:ts=2 sw=2 et
