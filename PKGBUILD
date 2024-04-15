# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname='wfinfo-ng-git'
_pkgname="wfinfo-ng"
pkgdesc="Analyze Warframe relic reward screen to determine platinum value of items."
pkgver=0.1.0.105.gd5e7c43
pkgrel=1
#epoch=1
arch=('any') #TODO: verify this
url="https://github.com/knoellle/wfinfo-ng"
license=('GPL-3.0')
depends=(curl '''''tesseract-data-eng''''' libxcb gcc-libs)
makedepends=(git rust\>=1.74 cmake clang libxtst fontconfig)
optdepends=('mlocate: to autodetect EE.log location')
provides=('wfinfo')
#conflicts=('wfinfo')
source=("$_pkgname::git+https://github.com/knoellle/wfinfo-ng.git" 'wfinfo.sh')
sha256sums=('SKIP' 'd26c9c91264551b3a1e3f644a80aa45fbf1af7af47fde8f179de4b0b4200bbe3')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf %s "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
	cd "$srcdir/$_pkgname"
	env CFLAGS= cargo build --release --locked
	sed 's/ | jq .//' -i "update.sh"
}

check(){
	cd "$srcdir/$_pkgname"
	echo Updating database for check...
	./update.sh
	echo Grabbing test-images/1.png... # (bypassing git-lfs)
	curl https://media.githubusercontent.com/media/knoellle/wfinfo-ng/master/test-images/1.png > test-images/1.png
	env CFLAGS= cargo test --release --locked -- --skip wfi_images_99_percent
}

package() {
	install -D -m755 "$srcdir/wfinfo.sh" "$pkgdir/usr/bin/wfinfo"
	install -D -m755 "$srcdir/$_pkgname/update.sh" "$pkgdir/usr/bin/wfinfo-update"
	install -D -m755 "$srcdir/$_pkgname/target/release/wfinfo" "$pkgdir/usr/bin/wfinfo-ng"
}
