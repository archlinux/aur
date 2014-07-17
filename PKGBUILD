# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=smc-git
pkgver=210.a0405c9
pkgrel=1
pkgdesc="Secret Maryo Chronicles (development version)"
arch=('i686' 'x86_64')
url="http://www.secretmaryo.org"
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'cegui-0.7' 'boost-libs' 'libgl')
makedepends=('boost' 'git')
conflicts=('smc')
provides=('smc')
source=(smc::"git+https://github.com/FluXy/SMC.git"
        "smc.desktop"
        "smc-get-to-world2.patch")
sha256sums=('SKIP'
            '291fca2243262c24cf086bec60ae77fd53f58bc42e876b224d58e96a5a35d79a'
            '04d2b8850005fea4cf8a66be48f2f3ffc3848851dabdc8d2294b6e65e021bca0')

pkgver() {
  cd smc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  patch -Np1 < smc-get-to-world2.patch
}

build() {
  cd smc/smc

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd smc/smc

  make DESTDIR="$pkgdir/" install

  # man and .desktop
  install -Dm644 makefiles/unix/man/smc.6 "$pkgdir"/usr/share/man/man6/smc.6
  install -Dm644 makefiles/unix/smc.xpm "$pkgdir"/usr/share/pixmaps/smc.xpm
  install -Dm644 ../../smc.desktop "$pkgdir"/usr/share/applications/smc.desktop
}
