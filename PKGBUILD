# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=jazip
_jazver=0.34
_debver=15.1
pkgver="$_jazver.$_debver"
pkgrel=1
pkgdesc='Program for maintaining Iomega Zip or Jaz drives and disks'
arch=('x86_64')
url='https://structbio.vanderbilt.edu/~jsmith/jazip/'
license=('custom:jazip')
depends=('xforms')
makedepends=('linux-headers')
install=jazip.install
# all_patches_to_0.34-14 and copyright were originally from
# https://deb.debian.org/debian/pool/main/j/jazip/jazip_0.34-15.1.debian.tar.gz
# but Debian no longer packages jaZip
source=("https://structbio.vanderbilt.edu/~jsmith/jazip/jaZip-$_jazver.src.tar.gz"
        'all_patches_to_0.34-14'
        'copyright')
sha256sums=('d3575c7b9b3d0d8083d7c4752d6d946fac99b71a17fe99918b11e9737592118c'
            'SKIP'
            'SKIP')

prepare() {
	cd "jaZip-$_jazver"
	cat ../all_patches_to_0.34-14 | patch -p1
}

build() {
	cd "jaZip-$_jazver"
	make CFLAGS='-O -std=gnu99 -fcommon -fpermissive'
}

package() {
	cd "jaZip-$_jazver"
	install -Dm755 jazip "$pkgdir/usr/bin/jazip"
	install -Dm644 jazip.conf "$pkgdir/etc/jazip.conf"
	install -Dm644 ../copyright "$pkgdir/usr/share/licenses/jazip"
	mkdir -p "$pkgdir/usr/share/jazip"
	cp docs/*.help "$pkgdir/usr/share/jazip"
}
