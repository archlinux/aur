# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe
_dirver=7.2
pkgver=7.2.13
pkgrel=5
pkgdesc="The extensible drawing editor"
url="http://ipe.otfried.org/"
depends=('lua' 'qt5-base' 'freetype2' 'zlib' 'poppler' 'hicolor-icon-theme')
arch=('i686' 'x86_64')
license=("GPL")
conflicts=('ipe')
source=("http://dl.bintray.com/otfried/generic/$pkgname/$_dirver/$pkgname-$pkgver-src.tar.gz"
        "ipe.bash-completion"
        "config.patch"
        "ipe.desktop"
        )

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  patch config.mak < "$srcdir/config.patch"
  sed -i '/#include <xlocale.h>/d' ipelib/ipeplatform.cpp
}

build() {
  # Ipe
  cd "$srcdir/$pkgname-$pkgver/src"
  make IPEPREFIX=/usr
}

package() {
  # Ipe
  cd "$srcdir/$pkgname-$pkgver/src"
  INSTALL_ROOT="$pkgdir" make install IPEPREFIX=/usr

  # Lua binding
  mkdir "$pkgdir/usr/lib/lua"
  ln -s /usr/lib/libipelua.so "$pkgdir/usr/lib/lua/ipe.so"

  # Bash completion
  mkdir -p "$pkgdir/etc/bash_completion.d"
  install "$srcdir/ipe.bash-completion" "$pkgdir/etc/bash_completion.d/ipe"

  # Desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/ipe.desktop" "$pkgdir/usr/share/applications/ipe.desktop"

  # Icons
  mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m644 "$srcdir/$pkgname-$pkgver/src/ipe/icons/ipe.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/src/ipe/icons/ipe128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/src/ipe/icons/ipe512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ipe.png"
}

# vim: ft=sh syn=sh et ts=2 sw=2
md5sums=('2653159b975ac83890f70095200f0658'
         '694f0d5402655901be385647e5d8d6e3'
         'd4e289bce01302a8b76a0df294c7de40'
         '19fd2cac2564125afa0149105d00d3dd')
