# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=last-mission-sdl
pkgver=0.8
_githash=81cb1b45aa2e24e088440910bb764d5daa6f5028 # this is needed as there are no tags
pkgrel=1
pkgdesc='Side-view arcade game (inspired by Underwurlde and Starquake)'
arch=('i686' 'x86_64')
url="https://github.com/dmitrysmagin/last-mission"
license=('GPL')
depends=('sdl_mixer')
source=($pkgname-$pkgver.tar.gz::"https://github.com/dmitrysmagin/last-mission/archive/$_githash.tar.gz")
sha256sums=('1acf05deb0efe14abf7cea92dd62fe5c67de817c4eda4ba296f4c6bb9e1deb3d')

prepare() {
  cd last-mission-$_githash
  # change data directory
  sed "s|sound/|/usr/share/$pkgname/&|g" -i sound.c
  # add define and lib to fix build and add our build flags
  sed 's|CFLAGS =\(.*\)|CFLAGS += -D__UNIX__ \1|;s|$(LFLAGS)|$(LDFLAGS) & -lm|' -i Makefile
}

build() {
  make -C last-mission-$_githash
}

package() {
  cd last-mission-$_githash

  # binary
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  # data
  install -d "$pkgdir"/usr/share/$pkgname/sound
  install -m644 sound/*.ogg "$pkgdir"/usr/share/$pkgname/sound
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
}
