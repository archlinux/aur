# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=codec2-lpcnet
_pkgname=codec2
pkgver=1.1.1
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
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('d59c644018f16d99e0c5a7e163a2888cb1250f822dd00df419ee454552c61774ff6cdb5b1cf0a9bc09f0395bd78cf1b1b39217b8d314d238d65dc4c922bcbec2')

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
