# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname='wfinfo-ng-git'
_pkgname="wfinfo-ng"
pkgdesc="Analyze Warframe relic reward screen to determine platinum value of items."
pkgver=0.1.0.112.g399be07
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
sha256sums=('SKIP' '79a10b27dc87328fbb35bb7c10f3eb33ff6459c55e301ada4db2f352ae5f770f')

pkgver() {
	cd "$srcdir/$_pkgname"
	grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1|tr -d \\n
	printf .
	git rev-list --count HEAD|tr -d \\n
	printf .g
	git rev-parse --short HEAD|tr -d \\n
}

build(){
	cd "$srcdir/$_pkgname"
	env CFLAGS= cargo build --bin wfinfo --release
	sed 's/ | jq .//' -i "update.sh"
}

check(){
	cd "$srcdir/$_pkgname"
	echo Updating database for check...
	./update.sh
	echo Grabbing test-images/1.png... # (bypassing git-lfs)
	curl https://media.githubusercontent.com/media/knoellle/wfinfo-ng/master/test-images/1.png > test-images/1.png
	env CFLAGS= cargo test --bin wfinfo --release -- --skip wfi_images_99_percent
}

package() {
	# wrapper script
	install -D -m755 "$srcdir/wfinfo.sh" "$pkgdir/usr/bin/wfinfo"
	# (edited from upstream) update script
	install -D -m755 "$srcdir/$_pkgname/update.sh" "$pkgdir/usr/bin/wfinfo-update"
	# main binary
	install -D -m755 "$srcdir/$_pkgname/target/release/wfinfo" "$pkgdir/usr/bin/wfinfo-ng"
	# Following can be added by 1. removing '--bin wfinfo' from the cargo build/test above and 2. uncommenting them here
	# Sanctuary Onslaught indicator helper, watches key $1 (only 1-4) and turns red for $2 seconds
	#install -D -m755 "$srcdir/$_pkgname/target/release/ability-timer" "$pkgdir/usr/bin/wfinfo-ability-timer"
	# same as main binary (dumps into $PWD! needs databases in $PWD!), but takes filenames of images as args instead of its own screenshots
	#install -D -m755 "$srcdir/$_pkgname/target/release/image" "$pkgdir/usr/bin/wfinfo-image"
	# lists all relics in tier $1 (also accepts 'tracedump') by expected plat value for $2 players (opt, default 4)
	#install -D -m755 "$srcdir/$_pkgname/target/release/relics" "$pkgdir/usr/bin/wfinfo-relics"
	# probably not useful unless you plan to contribute upstream:
	# debugger for theme detection or compensation, takes image args
	#install -D -m755 "$srcdir/$_pkgname/target/release/theme_tune" "$pkgdir/usr/bin/wfinfo-theme-tune"
}
