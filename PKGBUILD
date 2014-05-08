# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=asclock-xlib
_pkgname=asclock
pkgver=2.0.12
pkgrel=3
pkgdesc="The AfterStep clock dock app - Xlib version"
url="http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#asclock"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
provides=('asclock')
conflicts=('asclock-xlib' 'asclock-gtk')
source=("http://gentoo.osuosl.org/distfiles/$_pkgname-$pkgver.tar.gz"
        "asclock.desktop")
md5sums=('99cb6491358bb0044e9b75b2e06b043b'
         '00cbeb63e46bc7c402e20680e0aa1fec')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  rm -fr default_theme
  mkdir default_theme
  cd default_theme
  cp -s ../themes/classic/* .
  rm -f month.xpm
  cp -s ../languages/english/month.xpm .
  for f in *.xpm ; do
    sed -e 's,^static ,,' -i $f
  done
  cd ..
  sed -e 's,share/asclock/,share/asclock/themes/,' -i config.c
  xmkmf
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install install.man
  install -d "$pkgdir/usr/share/asclock/themes"
  install -d "$pkgdir/usr/share/asclock/themes/Newstone"
  install -t "$pkgdir/usr/share/asclock/themes/Newstone" themes/Newstone/*
  install -d "$pkgdir/usr/share/asclock/themes/Orb"
  install -t "$pkgdir/usr/share/asclock/themes/Orb" themes/Orb/*
  install -d "$pkgdir/usr/share/asclock/themes/Stone"
  install -t "$pkgdir/usr/share/asclock/themes/Stone" themes/Stone/*
  install -d "$pkgdir/usr/share/asclock/themes/beats"
  install -t "$pkgdir/usr/share/asclock/themes/beats" themes/beats/*
  install -d "$pkgdir/usr/share/asclock/themes/classic"
  install -t "$pkgdir/usr/share/asclock/themes/classic" themes/classic/*
  install -d "$pkgdir/usr/share/asclock/themes/shaped"
  install -t "$pkgdir/usr/share/asclock/themes/shaped" themes/shaped/*
  install -Dm0644 "$srcdir/asclock.desktop" \
    "$pkgdir/usr/share/applications/asclock.desktop"
}

# vim: set sw=2 et:
