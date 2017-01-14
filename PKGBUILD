# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=streetsofrageremake
pkgver=5.1
pkgrel=4
pkgdesc="A remake of the classic Streets of Rage 1, 2 and 3 by Sega"
arch=("i686" "x86_64")
url="http://sorr.forumotion.net/t148-sor-v5-for-linux-debian-download-links"
license=("custom")
if [ "$CARCH" = "i686" ]; then
	depends=("alsa-lib" "libpng12" "sdl_mixer" "smpeg" "zlib")
else
	depends=("lib32-alsa-lib" "lib32-libpng12" "lib32-sdl_mixer" "lib32-smpeg" "lib32-zlib")
fi
options=(!strip)
install="sorr.install"
source=("http://launchpad.net/~ubuntugames/+archive/ubuntu/games/+files/sorr_5.1.orig.tar.gz"
	"Readme.linux"
	"sorr-wrapper")
sha1sums=('c27339909ab4c4e98f2d392442dede27c4b9dc20'
          'e856777159b428b5e60b5ef78a8bbb8dd97e70fa'
          '520bc41fa8e9f60304266b8e83d8b6fcd1878963')

## Old source: keep here in case it comes back online.
# "http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz"
# "http://www.soronline.net/downloads/SORRv051_REV030.zip"


DLAGENTS=("http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer http://www.soronline.net")

build() {
	cd "$srcdir"
	## We replace the broken launcher with a wrapper that will start the game
	## from $HOME/.sorr so that savegames and mods can be loaded from there.
	cp -f sorr-wrapper sorr
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/opt/sorr/"

	## The archive tends to change from host to host, hence the commented lines.

	## Data.
	# install -m755 bgdc bgdi sorr "$pkgdir/opt/sorr/"
	install -m755 bgdi sorr "$pkgdir/opt/sorr/"
	# install -m644 Manual.html Readme.txt SorMaker.dat SorR.dat "$pkgdir/opt/sorr/"
	install -m644 manual.html Readme.txt SorMaker.dat SorR.dat "$pkgdir/opt/sorr/"
	cp -r manual mod palettes data "$pkgdir/opt/sorr/"

	## Remove junk files.
	# rm "$pkgdir/opt/sorr/manual/img/Thumbs.db"

	## Libraries needed by the bennugd engine. WARNING: This is the most sensible
	## part. The choice of these libraries may highly depend on the target
	## operating system.
	install -dm755 "$pkgdir/opt/sorr/data/"
	install -m644 bennugd/libbgdrtm.so bennugd/libcrypto.so.1.0.0 bennugd/libdraw.so \
		"$pkgdir/opt/sorr/data/"

	## For some strange reasons, all files are marked as executable. Let's clean
	## this up.
	find "$pkgdir/opt/sorr"/{data,manual,mod,palettes} -type f -exec chmod a-x {} +

	## Launcher.
	install -dm755 "$pkgdir/usr/bin/"
	ln -s /opt/sorr/sorr "$pkgdir/usr/bin/sorr"

	## .desktop.
	install -Dm644 sorr.desktop "$pkgdir/usr/share/applications/sorr.desktop"

	## Icon.
	install -Dm644 sorr.png "$pkgdir/opt/sorr/sorr.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	ln -s /opt/sorr/sorr.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"

	## Extra files.
	install -Dm644 "Readme.linux" "$pkgdir/opt/sorr/Readme.linux"
}
