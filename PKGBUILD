# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=codec2-lpcnet
_pkgname=codec2
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc='Open source speech codec designed for communications quality speech between 450 and 3200 bit/s with support for LPCNet'
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url='https://github.com/drowe67/codec2'
depends=('lpcnetfreedv')
makedepends=('cmake')
provides=('freedv' 'codec2')
conflicts=('freedv' 'codec2')
source=("$url/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('a44e6eb3ec60b81e4dfefaa733c4f8a40c5e2e90454e964b14fbce896edd0877e32d917ce878a619d7e7e544c670231d7d0c9cd35659be6989fd18d474443489')

build() {
  cmake -B build -S $_pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=YES \
        -DLPCNET=YES \
        -Wno-dev

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  local _bin
  while read -r -d '' _bin
  do
      install -D -m755 "$_bin" -t "$pkgdir/usr/bin"
  done < <(find build -type f -regextype posix-extended \
           -regex '.*/(c2(demo|dec|enc|sim)|ch|freedv_(t|r)x|(cohpsk|fdmdv|fsk|ldpc|ofdm)_.*)' \
           -executable -print0)
  mv "$pkgdir/usr/bin"/{ch,c2ch}
}
