# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.1.5
pkgrel=7
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="http://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/naihe2010/apvlv/archive/v$pkgver.tar.gz
        gcc6.patch
        gcc7.patch)
sha256sums=('dca98157e63c9fec12d6514751ea26549813dc7b87d838b0003f31a444100a8a'
            '69f28540aec5b287208d0c5e3755ab2eab483fc5d90316620d0ab523e51ae9f9'
            'c53b9c44ca1bcfa689cd363f350a18cf7f915212c2ca9e726d2f0226c8faccf6')
backup=('etc/apvlvrc')

prepare() {
  cd $pkgname-$pkgver

  # Fix build
  patch -Np1 -i ../gcc6.patch
  patch -Np1 -i ../gcc7.patch
}

build() {
  cd $pkgname-$pkgver

  [[ -d build ]] || mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPVLV_WITH_DJVU=yes -DAPVLV_WITH_TXT=yes \
        -DAPVLV_WITH_UMD=no  ..

  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
