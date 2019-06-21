# Maintainer: Jean Lucas <jean@4ray.co

pkgname=kpatch
pkgver=0.6.3
pkgrel=3
pkgdesc="Live kernel patching"
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(elfutils)
makedepends=(gcc)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('0d266dd837ad651d7f46047cf2c8de527d08274a885a154c53354f4b3c5679d91c766d7d42294ffe71cc548e5ee865c7555f24001882b806f2fb48825f9b0c06')

prepare() {
  # Fix search structure
  sed -i 's/libexec/lib/g' kpatch-$pkgver/kpatch-build/kpatch-build
}

build() {
  cd kpatch-$pkgver
  make 
}

package() {
  cd kpatch-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # Remove incompatible init system file
  rm etc/init/kpatch.conf
  rmdir -p etc/init

  cd usr

  # Fix directory structure
  mv local/* .
  rmdir local
  mv lib{exec/kpatch/*,/kpatch}
  mv {s,}bin/kpatch
  rmdir -p libexec/kpatch sbin
}
