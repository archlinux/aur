# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: bangoskank <its.hip@gmail.com>

pkgname=circuslinux
pkgver=1.0.3
pkgrel=5
pkgdesc='Clone of the Atari 2600 game Circus Atari'
arch=('i686' 'x86_64')
url='http://www.newbreedsoftware.com/circus-linux/'
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
makedepends=('gendesk')
source=("ftp://ftp.tuxpaint.org/unix/x/circus-linux/src/circuslinux-$pkgver.tar.gz")
sha256sums=('bf9550ebd598a9e7d93a20d80ff466475122f8b023314bb1e07c31e8c608ce8a')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/-D$(TARGET_DEF)//' Makefile.in
  sed -i 's/#ifdef LINUX/#ifdef __linux/g' circuslinux.c
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc" --name="Circus Linux!"
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-joystick
  make
}


package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir"/usr install
  mv "$pkgdir"/usr/share/doc/circuslinux{-$pkgver,}
  install -Dm644 circuslinux.desktop "$pkgdir"/usr/share/applications/circuslinux.desktop
  install -Dm644 data/images/circuslinux-icon.xpm "$pkgdir"/usr/share/pixmaps/circuslinux.xpm
}
