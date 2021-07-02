# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: bangoskank <its.hip@gmail.com>

pkgname=circuslinux
pkgver=1.0.3
pkgrel=6
pkgdesc='Clone of the Atari 2600 game Circus Atari'
arch=('x86_64')
url='http://www.newbreedsoftware.com/circus-linux/'
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'hicolor-icon-theme')
source=("ftp://ftp.tuxpaint.org/unix/x/circus-linux/src/circuslinux-$pkgver.tar.gz"
        "$pkgname.desktop")
sha512sums=('292bcaad39342ad69862f1add36b11505ca5f2601637a8db6fad438c5a4b32d7801bc7e6c08b903b0fb8bf68dcb3ec8d968fb913cde65941b9b9ac64b5a5266f'
            'fa87b7d0e771d4ff04623e9962fe978dbf49e2af8457daeb39ee95d2706b414a2d6a26c8cf018d260b2c1f347a71afdfb4e42a71eb74fd6e2231b938996c5b16')

prepare() {
  cd $pkgname-$pkgver
  # Fix build
  sed -i -e 's/CFLAGS  = @CFLAGS@/AM_CFLAGS =/' \
      -e 's/circuslinux_CFLAGS  = CFLAGS/circuslinux_CFLAGS  = $(AM_CFLAGS)/' \
      -e '/^docdir =/d' Makefile.am
  sed -i 's/ $(pkgdatadir)/ $(DESTDIR)$(pkgdatadir)/' data/Makefile.am
  # Fix version information
  sed -i "s/AM_INIT_AUTOMAKE(.*)/AM_INIT_AUTOMAKE($pkgname,$pkgver)/" configure.in
}

build() {
  cd $pkgname-$pkgver
  AUTOMAKE="automake --foreign" autoreconf -fi
  ./configure --prefix=/usr --enable-joystick
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  install -d "$pkgdir"/usr/share/icons/hicolor/32x32/apps
  ln -s /usr/share/$pkgname/data/images/$pkgname-icon.xpm \
      "$pkgdir"/usr/share/icons/hicolor/32x32/apps/$pkgname.xpm

  install -Dm 644 -t "$pkgdir"/usr/share/applications/ "$srcdir/$pkgname.desktop"
}
