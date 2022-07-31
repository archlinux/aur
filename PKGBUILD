# Maintainer: Swift Geek <swiftgeek «at» gmail> 
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: muhviehstarr <timo@it-kraut.net>

pkgname=e4rat
pkgver=0.2.3
pkgrel=5
pkgdesc="Toolset to accelerate the boot process and application startups for systems with ext4 root partitions."
arch=('i686' 'x86_64')
url="http://e4rat.sourceforge.net/"
license=('GPL')
depends=('e2fsprogs>=1.41' 'gettext>=0.18' 'boost-libs>=1.41' 'audit>=0.1.7')
makedepends=('git' 'cmake>=2.6' 'boost' 'perl' 'openmpi')
conflicts=('ureadahead' 'e4rat-preload-lite' 'e4rat-preload-lite-git' 'e4rat-lite' 'e4rat-lite-git')
optdepends=('bootchart2: A "startup" graphing tool')
options=(!strip)
backup=(etc/e4rat.conf)
source=( "http://downloads.sourceforge.net/project/$pkgname/$pkgver/e4rat_${pkgver}_src.tar.gz" \
        'logging.patch' \
	'sysmacros_h.patch' \
        'boost-fs3-v2.patch'
	'cmake_boost.patch'
	'cmake.patch'
	'build.patch')

prepare () {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/boost-fs3-v2.patch"
  patch -p0 -i ../logging.patch
  patch -p0 -i ../sysmacros_h.patch
  patch -p1 -i ../cmake_boost.patch
  patch -p0 -i ../cmake.patch
  patch -p1 -i ../build.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CORE_LIBRARY_STATIC=true -DCMAKE_INSTALL_PREFIX="/usr" .
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/var/lib/$pkgname"
}

sha256sums=('f6feda9618eff0f9442baf771b4776b634e5a2f39e678c10e4c7946b2c6a96a0'
            'd54959ea7fb0629de51f6b530ee72082863756bbe0b0b5af0965aa5ad9ac9739'
            'ea35d1f7f8b6c4be9f20cc6ffbe72446dbdb6b99df450f29855a1cf9cf79362a'
            '9a9786d6167e4a47d1733735745b0eadeabf487886405df9e6771a28f3a20965'
            '0978a893f73dbd16ef727b59f865cb9079dd3a357f43188308a1ea303177dd02'
            '626f5663c6d5690c119e2e21402ce352285d0771806cc7119ba6e4c785e6e3b1'
            'f045addc960ec356f4063528a6a9e0a2abf8bd8e6b04e70f7fb54db75c9382cc')
