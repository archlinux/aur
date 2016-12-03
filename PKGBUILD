# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Loui Chang <louipc dot ist at no spam gmail company>

pkgname=tomatoes
pkgver=1.55
pkgrel=13
pkgdesc="How many tomatoes can you smash in ten short minutes?"
url="http://tomatoes.sourceforge.net"
license=('ZLIB')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'glu')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-linux-src-$pkgver.tar.bz2"
        "https://downloads.sourceforge.net/$pkgname/$pkgname-linux-1.5.tar.bz2"
        "0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch"
        "0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch"
        "0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch"
        "config.cfg"
        "tomatoes.desktop")
sha1sums=('aa123a5fa9c8c0223c602c0cffe8a5bb0ebad60c'
          '8dc306617800f7ccc1e8610fb39e87d8181c482d'
          '65faa7dc05d4f5629339cf4150f5dcbf2626e3a5'
          '6ad404f67a05781efe8787773e352af1a2922c60'
          '77c85236c92f1746aa1b9ec0f42951b15a73eda9'
          'e241ac2f76abad1f618e20f8e2d0089cdfa555af'
          'c87f8bbbb536d34a07d5eccc5d58a31d394d6ed3')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
  patch -p1 < ../0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch
  patch -p0 < ../0003-tomatoes-1.55-config-hiscore-file-saving-loading.patch

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

  install -d "$pkgdir"/usr/share/$pkgname
  cp -r ../$pkgname-1.5/* "$pkgdir"/usr/share/$pkgname

  # Change special key to right ctrl for altgr users and others.
  install -m644 ../config.cfg "$pkgdir"/usr/share/$pkgname

  install -Dm755 tomatoes "$pkgdir"/usr/bin/tomatoes

  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/tomatoes.png
  install -Dm644 ../tomatoes.desktop "$pkgdir"/usr/share/applications/tomatoes.desktop

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
