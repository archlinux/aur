# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>

pkgname=kpatch-git
pkgver=0.6.3+42+gd3a50c4
pkgrel=1
pkgdesc="Live kernel patching (git)"
arch=(i686 x86_64)
url=https://github.com/dynup/kpatch
license=(GPL2)
depends=(elfutils)
makedepends=(git gcc)
provides=(kpatch)
conflicts=(kpatch)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd kpatch
  git describe --tags | sed 's/v//;s/-/+/g'
}

prepare() {
  # Fix search structure
  sed -i 's/libexec/lib/g' kpatch/kpatch-build/kpatch-build
}

build() {
  cd kpatch
  make
}

package() {
  cd kpatch
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
