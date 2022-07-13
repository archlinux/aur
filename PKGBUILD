# Maintainer: edombek <edombek@yandex.ru>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_pkgname=codec2
pkgname=$_pkgname-1.0.3
pkgver=1.0.3
_tag=${pkgver/%.?/${pkgver##*.}}
pkgrel=2
epoch=1
pkgdesc='Open source speech codec designed for communications quality speech between 450 and 3200 bit/s (older version for sdrangel)'
arch=('x86_64')
license=('LGPL2.1')
url='https://github.com/drowe67/codec2'
makedepends=('cmake')
provides=('freedv' 'codec2')
conflicts=('freedv')
source=("$url/archive/v$_tag/$_pkgname-$_tag.tar.gz")
sha512sums=('1b59a0520d55b0f92b72a51dde0f58a0cd845056195734d23bf59bf44e7b5c7431bdc3cebe7c60aef7dadf3ec02f9edd62f041b4b283c05a4b50a0380f3ed67c')

build() {
  cmake -B build -S $_pkgname-$_tag \
  	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_INSTALL_PREFIX=/usr \
  	-DCMAKE_SKIP_RPATH=YES \
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
           -regex '.*/(c2(demo|dec|enc|sim)|freedv_(t|r)x|(cohpsk|fdmdv|fsk|ldpc|ofdm)_.*)' \
           -executable -print0)
}
