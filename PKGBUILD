# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=last-mission-sdl-git
pkgver=r25.00d2625
pkgrel=1
pkgdesc='Side-view arcade game (inspired by Underwurlde and Starquake, development version)'
arch=('i686' 'x86_64')
url="https://github.com/dmitrysmagin/last-mission"
license=('GPL')
depends=('sdl_mixer')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/dmitrysmagin/last-mission.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-*}
  # change data directory
  sed "s|\"sound/|\"/usr/share/${pkgname%-*}/sound/|g" -i sound.c

  # add define and lib to fix build and add our build flags
  sed 's|CFLAGS =\(.*\)|CFLAGS +=\1|;s|$(LFLAGS)|$(LDFLAGS) & -lm|' -i Makefile
}

build() {
  make -C ${pkgname%-*}
}

package() {
  cd ${pkgname%-*}

  # binary
  install -Dm755 ${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
  # data
  install -d "$pkgdir"/usr/share/${pkgname%-*}/sound
  install -m644 sound/*.ogg "$pkgdir"/usr/share/${pkgname%-*}/sound
  # doc
  install -d "$pkgdir"/usr/share/doc/${pkgname%-*}
  install -m644 *.txt "$pkgdir"/usr/share/doc/${pkgname%-*}
}
