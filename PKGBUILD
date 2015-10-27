# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=diskscan
pkgver=0.17
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python-yaml')
makedepends=('ninja' 'ctags')
install=
source=("https://codeload.github.com/baruch/$pkgname/tar.gz/$pkgver"
	"patch-ninja")
sha256sums=('92f99352d70dbfb7a806e5d706821a4b3ec2841b0ac7997c072a896e2da3a595' '2e92c4517e154d22319195f2486b4d6bfef856215ce8778dd698daa175fa9117')
#sha256sums=(SKIP SKIP)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	#To fix build with ninja 1.6
	patch build.ninja ../patch-ninja

	#To fix a problem with python 3
	sed -i 's/file(filename)/open(filename)/' libscsicmd/structs/ata_struct_2_h.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	ninja
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"

	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
