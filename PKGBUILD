# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname='wfinfo-ng-git'
_pkgname="wfinfo-ng"
pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
pkgver=0.1.0.105.gd5e7c43
pkgrel=1
epoch=1
arch=('any') #TODO: verify this
url="https://github.com/knoellle/wfinfo-ng"
license=('GPL-3.0')
depends=('curl' 'jq') # database updates
makedepends=('git' 'rust>=1.74' 'cargo' 'libxrandr' 'tesseract')
#checkdepends=('')
optdepends=('mlocate: to autodetect EE.log location')
provides=('wfinfo')
#conflicts=('wfinfo')
source=("$_pkgname::git+https://github.com/knoellle/wfinfo-ng.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf %s "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
	cd "$srcdir/$_pkgname"
	env CARGO_INCREMENTAL=0 CFLAGS= cargo build --release --locked
}

check(){
	cd "$srcdir/$_pkgname"
	echo Updating database for check...
	./update.sh
	env CARGO_INCREMENTAL=0 CFLAGS= cargo test --release
}

package() {
	install -D -m755 "$srcdir/wfinfo.sh" "$pkgdir/usr/bin/wfinfo"
	install -D -m755 "$srcdir/$_pkgname/update.sh" "$pkgdir/usr/bin/wfinfo-update"
	install -D -m755 "$srcdir/$_pkgname/target/release/wfinfo" "$pkgdir/usr/bin/wfinfo-ng"
}
