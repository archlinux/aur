# Maintainer: willemw <willemw12@gmail.com>

pkgname=mergerfs-git
pkgver=2.40.2.r0.g42d0b57
pkgrel=1
pkgdesc='Featureful union filesystem'
arch=(x86_64)
url=https://github.com/trapexit/mergerfs
license=('custom:ISC')
makedepends=(git)
#optdepends=('fuse2: mount via fstab' 'mergerfs-tools: manage data in a pool')
optdepends=('fuse2: mount via fstab' 'mergerfs-tools-git: manage data in a pool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's|^\(VERSION=\).*|\1"'$pkgver'"|' $pkgname/buildtools/update-version
}

build() {
  make -C $pkgname
}

package() {
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  make -C $pkgname DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}
