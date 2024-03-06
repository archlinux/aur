# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=hugetracker-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='The music composition suite for the Nintendo Game Boy'
arch=('x86_64')
url='https://nickfa.ro/index.php?title=HUGETracker'
license=('custom:public domain')
provides=('hugetracker')
conflicts=('hugetracker')
makedepends=()
# `rgbds` is shelled out to at runtime, but namcap doesn't know that.
# The program also explicitly makes calls to `fontconfig` and `pango`, so mark them
# explicitly, despite namcap's complaints.
depends=(fontconfig gdk-pixbuf2 glib2 gtk2 pango 'rgbds>=0.5.0' sdl2
	 libatk-1.0.so libcairo.so)
optdepends=('ffmpeg: "Export song" functionality')
source=("hUGETracker.zip::https://github.com/SuperDisk/hUGETracker/releases/download/v$pkgver/hUGETracker-$pkgver-linux.zip"
        LICENSE)
sha256sums=('ad43114845be0facf5b8f72bffcfb3cb82712356a956151c450184245384c499'
            '89e3f0dbfb531db8d9ba1b20865407b35a0aad5b3f5468bd8527a17a5026e836')
noextract=('hUGETracker.zip')


prepare() {
	unzip -od hugetracker hUGETracker.zip
}

package() {
	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	for f in hugetracker/*; do
		if [[ "$f" = hugetracker/hUGETracker || "$f" = hugetracker/uge2source ]]; then
			install -Dvsm 755 -T "$f" "$pkgdir/usr/bin/$(basename "${f@L}")"
		elif ! [[ -d "$f" ]]; then
			install -Dvm 644 -T "$f" "$pkgdir/usr/share/$f"
		elif [[ "$f" = hugetracker/hUGEDriver ]]; then
			install -Dvm 644 -t "$pkgdir/usr/share/$f" "$f"/{*.asm,include/*}
		else
			find "$f" -type f -exec install -Dvm 644 -t "$pkgdir/usr/share/{}" '{}' \;
		fi
	done
}
