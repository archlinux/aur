# Maintainer: nalquas <nalquas.dev@gmail.com>

pkgname=tvtower-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A remake of MadTV - by fans, for fans."
arch=('x86_64')
url="https://www.tvtower.org/"
license=('custom')
depends=('libglvnd' 'freetype2') # dependencies determined using namcap
provides=('tvtower')
source=("$pkgname-$pkgver.zip::https://github.com/TVTower/TVTower/releases/download/v0.7.2/TVTower_v0.7.2.zip")
sha256sums=('577c0585d7508c9e50a17ba12fa43b1c9bcda6ff08126a9faa9b7cee7075bcf2')

package() {
	# First, install the liense
	install -Dm644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# Then, install the game
	install -Dm755 TVTower_Linux64 "$pkgdir/usr/share/tvtower/tvtower"
	install -Dm644 tvtower.png "$pkgdir/usr/share/tvtower/tvtower.png"
	install -Dm644 config/* -t "$pkgdir/usr/share/tvtower/config"
	install -Dm644 docs/* -t "$pkgdir/usr/share/tvtower/docs"
	install -Dm644 Misc/* -t "$pkgdir/usr/share/tvtower/Misc"
	#install -Dm644 res/* -t "$pkgdir/usr/share/tvtower/res"
	cp -r res "$pkgdir/usr/share/tvtower/res" # This is a workaround since "install" doesn't allow recursive directory copying
	
	# Since TVTower wants to write logs and savegames to its install directory, let's fulfill that wish.
	# We're doing this by making the logfiles and savegames writable by every user (777).
	mkdir -p "$pkgdir/usr/share/tvtower/logfiles"
	mkdir -p "$pkgdir/usr/share/tvtower/savegames"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.ai1.txt"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.ai2.txt"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.ai3.txt"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.ai4.txt"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.app.txt"
	touch "$pkgdir/usr/share/tvtower/logfiles/log.app.error.txt"
	touch "$pkgdir/usr/share/tvtower/log.profiler.txt"
	chmod -R 777 "$pkgdir/usr/share/tvtower/logfiles"
	chmod 777 "$pkgdir/usr/share/tvtower/savegames"
	chmod 777 "$pkgdir/usr/share/tvtower/log.profiler.txt"
	
	# For easier terminal access to the game, create a symlink in /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/share/tvtower/tvtower "$pkgdir/usr/bin/tvtower"
	
	# Finally, create and install a .desktop file
	touch TVTower.desktop
	echo """[Desktop Entry]
Name=TVTower
Comment=A remake of MadTV - by fans, for fans.
Exec=/usr/bin/tvtower
Icon=/usr/share/tvtower/tvtower.png
Type=Application
Categories=Game;""" >> TVTower.desktop
	install -Dm644 TVTower.desktop "$pkgdir/usr/share/applications/TVTower.desktop"
}
