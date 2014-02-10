# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=ecwolf-hg
pkgver=r987.4169dcc8502a
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL (development version)'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL')
depends=('sdl_mixer' 'libjpeg' 'gtk2')
makedepends=('mercurial' 'cmake')
provides=('ecwolf')
conflicts=('ecwolf')
install=ecwolf.install
source=("hg+https://bitbucket.org/Blzut3/ecwolf")
md5sums=('SKIP')

pkgver() {
  cd ecwolf
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd ecwolf/src

  # data dir hack
  sed -e 's|OpenResourceFile(datawad|OpenResourceFile(FString("/usr/share/ecwolf/") + datawad|' \
    -e 's|wadfiles.Push("ecwolf.pk3|wadfiles.Push("/usr/share/ecwolf/ecwolf.pk3|' -i wl_iwad.cpp
}

build() {
  cd ecwolf

  # enable gpl licensed opl emulator
  cmake ./ -DGPL=ON
  make
}

package() {
  cd ecwolf
  # binary + data
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
}
