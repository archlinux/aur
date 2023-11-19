# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=last-mission-sdl
pkgver=0.8
pkgrel=2
pkgdesc='Side-view arcade game (inspired by Underwurlde and Starquake)'
arch=('i686' 'x86_64')
url="https://github.com/dmitrysmagin/last-mission"
license=('GPL')
depends=('sdl_mixer')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('78a46b53a5f559c7972cb1cf5e0fe2d6db2b3b358d465f29bebae54228ccdb62')

prepare() {
  cd last-mission-$pkgver
  # change data directory
  sed "s|sound/|/usr/share/$pkgname/&|g" -i sound.c
  # add defines and library to fix building and add our build flags
  sed -e 's|CFLAGS =\(.*\)|CFLAGS += -D__UNIX__ -DDEBUG \1|' \
   -e 's|$(LFLAGS)|$(LDFLAGS) & -lm|' -i Makefile
}

build() {
  make -C last-mission-$pkgver
}

package() {
  cd last-mission-$pkgver

  # binary
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  # data
  install -d "$pkgdir"/usr/share/$pkgname/sound
  install -m644 sound/*.ogg "$pkgdir"/usr/share/$pkgname/sound
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
}
