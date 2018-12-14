# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Margot Xara <xara.margot@gmail.com>
# Contributor Daniel Illgen <daniel.illgen@googlemail.com>
# Contributor: Christer Solskogen <solskogen@carebears.mine.nu>
# Contributor: Giovanni Condello <condellog@gmail.com>

pkgname=aranym
pkgver=1.0.2
pkgrel=2
pkgdesc="Atari Running on Any Machine"
url="https://aranym.github.io"
depends=('gcc-libs' 'bash' 'sdl_image' 'mpfr')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/"$pkgname"_"$pkgver".orig.tar.gz)
md5sums=('4eeaf781e41785d83b966df44dead249')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # aranym-jit isn't available for x86_64 architecture
  if [ "$CARCH" == "i686" ]; then
    ./configure --prefix=/usr --disable-sdl2 --enable-usbhost --mandir=/usr/share/man --disable-nat-debug --enable-jit-compiler --enable-nfjpeg
    make
    mv aranym aranym-jit
    make clean
  fi

  ./configure --prefix=/usr --disable-sdl2 --enable-usbhost --mandir=/usr/share/man --disable-nat-debug --enable-fullmmu --enable-lilo --enable-fixedvideoram --enable-nfjpeg
  make
  mv aranym aranym-mmu
  make clean

  ./configure --prefix=/usr --disable-sdl2 --enable-usbhost --mandir=/usr/share/man --disable-nat-debug --disable-nat-debug --enable-nfjpeg
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  if [ "$CARCH" == "i686" ]; then
    install aranym-jit "$pkgdir"/usr/bin
  fi

  install aranym-mmu "$pkgdir"/usr/bin
  install aratapif "$pkgdir"/usr/bin
  install -D contrib/icon-32.png \
    ${pkgdir}/usr/share/pixmaps/aranym.png
  install -D contrib/aranym.desktop \
    ${pkgdir}/usr/share/applications/aranym.desktop
}
