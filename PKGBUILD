#Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
pkgname=ectool-samus-git
_gitname=ectool
pkgver=1.1.0.5819.g4234992812
pkgrel=1
pkgdesc="ectool for Chromebook Pixel 2015 for controlling lightbar and fans."
arch=(i686 x86_64)
url="https://www.chromium.org/chromium-os/ec-development"
provides=('ectool')
depends=('arm-none-eabi-gcc' 'libftdi' 'libftdi-compat')
license=('BSD')
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/ec"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "$srcdir/ec"
  sed -i "s/-Werror /-std=gnu90 /g" Makefile.toolchain
  make PREFIX=/usr -j5 BOARD=samus
}

package() {
  cd "$srcdir/ec"
  install -Dm755 "$srcdir/ec/build/samus/util/ectool" "$pkgdir/usr/bin/ectool"
  
# install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
