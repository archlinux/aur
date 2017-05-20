# Maintainer: Difarem <difarem@gmail.com>
pkgname=pxtone-collage
pkgver=0925
pkgrel=3
pkgdesc="A set of tools for creating or playing pxtone files and other pxtone-related formats."
arch=(any)
url="http://studiopixel.sakura.ne.jp/pxtone/index.html"
license=('BSD')
depends=(wine)
makedepends=(gendesk)
source=(http://studiopixel.sakura.ne.jp/binaries/pxtone_$pkgver.zip
		pxtone-collage.png pxtone-noise.png pxtone-voice.png pxtone-player.png
		pxtone-collage pxtone-noise pxtone-voice pxtone-player launcher)
noextract=()
md5sums=('caa267b0255e2c10f62dbea236c317f3'
         '222ec089021c3199bdad842c4cdbfc92'
         '2c33da583d58d5622557a696d432663a'
         '20c1465e5cb81d5472a7b736de25b18b'
         '55583c6a843be421297ef74d35ef523e'
         'c89fe485d7177d8902e5c0993870220f'
         'fbea9e51af9a97aadcac46480fc3f5c5'
         'a2959cd6ebbddbde0ff676e5b298f175'
         '24b5fbce51f0f2017e21aeedefd2802d'
         '081483b5183d8d2b7408177269669716')
validpgpkeys=()

prepare() {
	# remove japanese.ico file to force english localization
	rm -f pxtone/japanese.ico

	# remove weirdly-named midi file
	rm -f pxtone/MIDI*.txt

	# generate shortcuts
	gendesk -f --pkgname "pxtone-collage" \
			--name "pxtone Collage" \
			--categories "Wine;AudioVideo;Audio" \
			--exec "pxtone-collage"

	gendesk -f --pkgname "pxtone-noise" \
			--name "pxtone Noise" \
			--categories "Wine;AudioVideo;Audio" \
			--exec "pxtone-noise"

	gendesk -f --pkgname "pxtone-voice" \
			--name "pxtone Voice" \
			--categories "Wine;AudioVideo;Audio" \
			--exec "pxtone-voice"

	gendesk -f --pkgname "pxtone-player" \
			--name "pxtone Player" \
			--categories "Wine;AudioVideo;Audio" \
			--exec "pxtone-player"
}

package() {
	# package icons
	install -Dm644 pxtone-collage.png $pkgdir/usr/share/pixmaps/pxtone-collage.png
	install -Dm644 pxtone-noise.png $pkgdir/usr/share/pixmaps/pxtone-noise.png
	install -Dm644 pxtone-player.png $pkgdir/usr/share/pixmaps/pxtone-player.png
	install -Dm644 pxtone-voice.png $pkgdir/usr/share/pixmaps/pxtone-voice.png

	# package shortcuts
	install -Dm644 pxtone-collage.desktop $pkgdir/usr/share/applications/pxtone-collage.desktop
	install -Dm644 pxtone-noise.desktop $pkgdir/usr/share/applications/pxtone-noise.desktop
	install -Dm644 pxtone-player.desktop $pkgdir/usr/share/applications/pxtone-player.desktop
	install -Dm644 pxtone-voice.desktop $pkgdir/usr/share/applications/pxtone-voice.desktop

	# package launchers
	install -Dm755 launcher $pkgdir/usr/share/pxtone/launcher
	install -Dm755 pxtone-collage $pkgdir/usr/bin/pxtone-collage
	install -Dm755 pxtone-noise $pkgdir/usr/bin/pxtone-noise
	install -Dm755 pxtone-player $pkgdir/usr/bin/pxtone-player
	install -Dm755 pxtone-voice $pkgdir/usr/bin/pxtone-voice

	install -d -m755 $pkgdir/usr/share/pxtone
	cp -ra pxtone/* $pkgdir/usr/share/pxtone
	find $pkgdir/usr/share/pxtone -type d -exec chmod 755 "{}" \;
	find $pkgdir/usr/share/pxtone -type f -exec chmod 644 "{}" \;
	rmdir $pkgdir/usr/share/pxtone/my_project # empty directory, namcap complains
	
	install -Dm644 pxtone/readme.txt $pkgdir/usr/share/licenses/pxtone-collage/readme.txt # license
}
