# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe
_dirver=7.2
pkgver=7.2.30
pkgrel=1
pkgdesc="The extensible drawing editor"
url="http://ipe.otfried.org/"
depends=('lua' 'qt6-base' 'qt6-svg' 'freetype2' 'zlib' 'poppler' 'hicolor-icon-theme' 'gsl' 'libspiro' 'qtspell')
arch=('i686' 'x86_64')
license=("GPL")
conflicts=('ipe')
source=("https://github.com/otfried/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "ipe.bash-completion"
        "config.patch"
        "ipe.desktop"
        )

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  patch config.mak < "$srcdir/config.patch"
  sed -i '/#include <xlocale.h>/d' ipelib/ipeplatform.cpp

  sed -i -e 's/"ipefonts.h"/<ipefonts.h>/' ipepresenter/ipepresenter.h
  sed -i -e 's/"ipethumbs.h"/<ipethumbs.h>/' ipepresenter/ipepresenter_qt.cpp
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
  mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ipe.png"
  install -m644 "$srcdir/$pkgname-$pkgver/artwork/ipe.iconset/icon_512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ipe.png"
}

# vim: ft=sh syn=sh et ts=2 sw=2
md5sums=('1c17d262321166c121d50f35bd2ea209'
         '694f0d5402655901be385647e5d8d6e3'
         '9b8ef63e12862f93ab8907a5763fb683'
         '19fd2cac2564125afa0149105d00d3dd')
