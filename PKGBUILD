# Maintainer: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
pkgname=esrpatch
pkgver=02
pkgrel=2
# This line is way over 80 characters, but a clear description for this rather specific tool is hard to make any shorter than this.
pkgdesc="A tool to patch DVD disc images for the Sony PlayStation 2 game console to make them burnable and working with ESR, an app for the PlayStation 2 made to play those burned games without swapping"
arch=('any')
url=http://psx-scene.com/forums/f164/esr-public-beta-58441/
license=('GPL')
depends=()
makedepends=('w3m')
source=()

prepare() {
	# A dirty hack to download the package; using W3m to dump the data at the download URL instead of using the usual PKGBUILD way due to 403 (forbidden) errors when done so.
	cd "$srcdir"
	echo "Downloading esrpatch-$pkgver.tar.gz and validating it using md5sum..."
	w3m -dump_source http://psx-scene.com/forums/attachments/f164/14193d1214904456-esr-public-beta-esrpatch-02.tar.gz > esrpatch-"$pkgver".tar.gz || (echo "Downloading esrpatch-$pkgver.tar.gz failed" >&2 ; exit 1)
	if [ $(md5sum esrpatch-02.tar.gz | head -c 32) = "bc6ec554c5cbe33cab6502b50c404a58" ];
		then {
			echo "Downloaded esrpatch-$pkgver.tar.gz and successfully validated it using md5sum"
			echo "Validating esrpatch-$pkgver.tar.gz using sha256sum...";
			if [ $(sha256sum esrpatch-02.tar.gz | head -c 64) = "9cddd307b2a0ca5f048797c94309700d1dcbf3cfc570e5fab60e5ae6c798ad9f" ];
				then {
					echo "Suddessfully validated esrpatch-$pkgver.tar.gz using sha256sum"
					echo "Unpacking esrpatch-$pkgver.tar.gz...";
					tar xzvf esrpatch-"$pkgver".tar.gz || (echo "Unpacking esrpatch-$pkgver.tar.gz failed" >&2 ; exit 1);
					echo "Unpacked esrpatch-$pkgver.tar.gz"
				};
				else echo "Validating esrpatch-$pkgver.tar.gz using sha256sum failed" && exit 1;
			fi;
		};
		else echo "Downloading esrpatch-$pkgver.tar.gz or validating it using md5sum failed" && exit 1;
	fi;
}

build() {
	cd esrpatch
	gcc main.c -o esrpatch
}

package() {
	cd "$srcdir"/esrpatch
	install -D esrpatch "$pkgdir"/usr/bin/esrpatch
}
