# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

pkgname=botan-2.3
pkgver=2.3.0
pkgrel=1
pkgdesc='Crypto library written in C++'
arch=('x86_64')
url='https://botan.randombit.net/'
license=('BSD')
depends=('xz')
makedepends=('python')
optdepends=('python: for using botan2.py')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC')
source=("https://botan.randombit.net/releases/Botan-${pkgver}.tgz"{,.asc})
sha256sums=('39f970fee5986a4c3e425030aef50ac284da18596c004d1a9cce7688c4e6d47c'
            'SKIP')

prepare() {
  cd "Botan-$pkgver"

  # botan benefits from -O3, and upstream devs are running benchmarks with it
  CXXFLAGS="$CXXFLAGS -O3" ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-zlib \
    --with-lzma

}

build() {
  make -C "Botan-$pkgver"
}

#check() {
#  cd "${pkgname^}-$pkgver"
#
#  ./botan-test
#}

package() {
  DESTDIR="$pkgdir" make -C "Botan-$pkgver" install

  # Remove everything but the versioned library.
  rm -rf "$pkgdir/usr/lib/libbotan-2.so"
  rm -rf "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/share/doc"
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -rf "$pkgdir/usr/lib/python"*

  install -Dm644 "Botan-$pkgver/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/randombit/botan
# vim: ts=2 sw=2 et:
