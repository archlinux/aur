# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=hurrican-svn
pkgver=r193
pkgrel=1
pkgdesc="Freeware jump and shoot game based on the Turrican game series (development version)"
arch=('i686' 'x86_64')
url="http://hurrican.sourceforge.net"
license=('custom: MIT')
depends=('sdl_image' 'sdl_mixer' 'libmodplug' 'libgl')
makedepends=('subversion' 'mesa')
conflicts=('hurrican')
source=(hurrican::"svn+http://svn.code.sf.net/p/hurrican/code/trunk#revision=193"
        hurrican.desktop
        hurrican.png)
sha256sums=('SKIP'
            '11f6a06115d543b9dfb74781c4db79224fceec2f6c0ceecd9c2cd15081d96174'
            'be6b84adf5bd89430f2e087d9fe51e9e769cf1a17fb89f4288e8d4551ecf0b84')

pkgver() {
  cd hurrican
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd hurrican/Hurrican/src

  # use different data directory
  sed 's|^DEFINES :=.*|& -DUSE_STORAGE_PATH="\\"/usr/share/hurrican\\""|' -i Makefile
  # add our C(XX)FLAGS
  sed "s/^CFLAGS :=.*/& $CFLAGS/g" -i Makefile
  # disable compressed texture support (broken)
  sed -r "s/-DUSE_PVRTC|-DUSE_ETC1//g" -i Makefile
}

build() {
  make TARGET=linux -C hurrican/Hurrican/src
}

package() {
  cd hurrican/Hurrican

  # executable
  install -Dm0755 hurricanlinux "$pkgdir"/usr/bin/hurrican

  # data
  for d in lang data/{levels,music,sfx,shaders,textures}; do
    install -d "$pkgdir"/usr/share/hurrican/$d
    install -m644 $d/*.* "$pkgdir"/usr/share/hurrican/$d
  done

  cd ..
  # readme and license
  install -Dm0644 README.txt "$pkgdir"/usr/share/doc/hurrican/README.txt
  install -m0644 Hurrican/readme.txt "$pkgdir"/usr/share/doc/hurrican
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/doc/hurrican/README.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd ..
  # .deskop integration
  install -Dm0644 hurrican.desktop "$pkgdir"/usr/share/applications/hurrican.desktop
  install -Dm0644 hurrican.png "$pkgdir"/usr/share/pixmaps/hurrican.png
}
