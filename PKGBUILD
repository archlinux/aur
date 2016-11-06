# Maintainer: Michael Straube <michael_straube@web.de>
# Contributor: Loui Chang <louipc dot ist at no spam gmail company>

pkgname=tomatoes
pkgver=1.55
pkgrel=11
pkgdesc="How many tomatoes can you smash in ten short minutes?"
url="http://tomatoes.sourceforge.net"
license=('ZLIB')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'glu')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-linux-src-$pkgver.tar.bz2
        http://downloads.sourceforge.net/$pkgname/$pkgname-linux-1.5.tar.bz2
        0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
        0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch
        config.cfg)
sha1sums=('aa123a5fa9c8c0223c602c0cffe8a5bb0ebad60c'
          '8dc306617800f7ccc1e8610fb39e87d8181c482d'
          '65faa7dc05d4f5629339cf4150f5dcbf2626e3a5'
          '6ad404f67a05781efe8787773e352af1a2922c60'
          'e241ac2f76abad1f618e20f8e2d0089cdfa555af')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
  patch -p1 < ../0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch

  sed -n '7,27p' README-src > LICENSE
}

build() {
  cd $pkgname-$pkgver

  LDFLAGS="/usr/lib/libSDL-1.2.so.0"

  make \
    MPKDIR=/usr/share/tomatoes/ \
    MUSICDIR=/usr/share/tomatoes/music/ \
    CONFIGDIR=/usr/share/tomatoes/ \
    OVERRIDEDIR=./
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,share/$pkgname}

  cp -r ../$pkgname-1.5/* "$pkgdir"/usr/share/$pkgname

  # Change special key to right ctrl for altgr users and others.
  install -m644 ../config.cfg "$pkgdir"/usr/share/$pkgname

  install -m755 tomatoes "$pkgdir"/usr/bin
  install -m644 icon.png "$pkgdir"/usr/share/$pkgname

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
