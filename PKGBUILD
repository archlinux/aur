# Maintainer: Jean Lucas <jean@4ray.co

pkgname=kpatch
pkgver=0.6.3
_commit=f4ed9ff76997114ed838a3b964508d721f19f293
pkgrel=2
pkgdesc="Live kernel patching"
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(elfutils)
makedepends=(gcc)
source=($url/archive/$_commit.tar.gz)
sha512sums=('a51f46f4c34b1f2322a5e22349684f5c90bb5d7eb5f173d636ef649d4159ff68697773dfdb977d54506b67294bdea1ea0df6a45947c7c2e82d7f130a366269f7')

prepare() {
  # Fix search structure
  sed -i 's/libexec/lib/g' kpatch-$_commit/kpatch-build/kpatch-build
}

build() {
  cd kpatch-$_commit
  make 
}

package() {
  cd kpatch-$_commit
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
