# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=opentitus
pkgver=0.8.0
pkgrel=1
pkgdesc="Rewrite of the game engine used in the old DOS-based games Titus the Fox and Moktar (the French version)"
arch=('i686' 'x86_64')
url="http://opentitus.sourceforge.net"
license=('GPL3')
depends=('sdl_mixer')
install=$pkgname.install
source=("http://downloads.sourceforge.net/$pkgname/OpenTitus_0.8.0_src.zip"
        "http://arch.carsten-teibes.de/aur-stuff/$pkgname-libopl_precompiled.tar.xz"
        "$pkgname.sh")
sha256sums=('ab1cb8ff02bc4b77508ccd948a6df387c0fa2b3c245800a01ca54acd0a02774e'
            '3e3195b4361e4a07dba2e0c445733542174babaf3bb407a48c49a305ef9d4150'
            '449365685b0b55556b4f70bd9ec91e685541e5cb1250050be73807889f9f2132')

prepare() {
  cd OpenTitus_${pkgver}_src
 
  # add our cflags
  sed 's|CFLAGS  =|CFLAGS +=|' -i Makefile_linux
  # use precompiled opl emulator
  if [ "$CARCH" == "i686" ]; then
    cp ../libopl32.a opl/libopl_linux.a
  else
    cp ../libopl64.a opl/libopl_linux.a
  fi
}

build() {
  cd OpenTitus_${pkgver}_src

  make -f Makefile_linux
}

package() {
  cd OpenTitus_${pkgver}_src

  # binary + launcher
  install -Dm755 $pkgname "$pkgdir"/usr/lib/$pkgname/$pkgname
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data, configs + docs
  install -d "$pkgdir"/usr/share/{,doc/}$pkgname
  install -m644 moktar/*.bin titus/*.bin titus{,_moktar}.conf \
    "$pkgdir"/usr/share/$pkgname
  install -m644 {Changelog,readme}.txt doc/* dev_status/* \
    "$pkgdir"/usr/share/doc/$pkgname
}
