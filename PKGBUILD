# Maintainer: gigamicro <gammamicro@gmail.com>
_pkgname="wfinfo-ng"
pkgname="$_pkgname-git"
pkgdesc="Analyze Warframe relic reward screen to determine platinum value of items."
pkgver=0.1.0.114.gc440b6b
pkgrel=1
arch=('any') #TODO: verify this
url="https://github.com/knoellle/wfinfo-ng"
license=('GPL-3.0')
depends=(curl '''''tesseract-data-eng''''' libxcb gcc-libs)
makedepends=(git rust\>=1.74 cmake clang libxtst fontconfig)
optdepends=('plocate: to autodetect non-default EE.log location')
provides=('wfinfo')
#conflicts=('wfinfo')
source=("$_pkgname::git+$url.git" 'wfinfo.sh')
sha256sums=('SKIP' '127b76052941393f822df669405053f914dd713f573b703a3c879718848ad0af')

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
	CFLAGS= cargo build --bin wfinfo --release --locked
}

check(){
	cd "$srcdir/$_pkgname"
	echo Updating database for check...
	cat ./update.sh | sed 's/| jq \.//' | sh -
	echo Grabbing test-images/1.png... # (bypassing git-lfs)
	curl https://media.githubusercontent.com/media/knoellle/wfinfo-ng/master/test-images/1.png > test-images/1.png
	CFLAGS= cargo test --bin wfinfo --release --locked -- --skip wfi_images_99_percent
}

package() {
	# wrapper script
	install -D -m755 "$srcdir/wfinfo.sh" "$pkgdir/usr/bin/wfinfo"
	# main binary
	install -D -m755 "$srcdir/$_pkgname/target/release/wfinfo" "$pkgdir/usr/bin/wfinfo-ng"
	# Following can be added by 1. removing '--bin wfinfo' from the cargo build/test above and 2. uncommenting them here
	# Sanctuary Onslaught ability use helper, watches key $1 (only 1-4) and turns red for $2 seconds (for reference: 1 2/5, 2 10/3, 3 10/3, 4 10/1)
	#install -D -m755 "$srcdir/$_pkgname/target/release/ability-timer" "$pkgdir/usr/bin/wfinfo-ability-timer"
	# same as main binary (dumps into $PWD! needs databases in $PWD!), but takes filenames of images as args instead of its own screenshots
	#install -D -m755 "$srcdir/$_pkgname/target/release/image" "$pkgdir/usr/bin/wfinfo-image"
	# lists all relics in tier $1 (also accepts 'tracedump') by expected plat value for $2 players (opt, default 4)
	#install -D -m755 "$srcdir/$_pkgname/target/release/relics" "$pkgdir/usr/bin/wfinfo-relics"
	# probably not useful unless you plan to contribute upstream:
	# debugger for theme detection or compensation, takes image args
	#install -D -m755 "$srcdir/$_pkgname/target/release/theme_tune" "$pkgdir/usr/bin/wfinfo-theme-tune"
}
