# Maintainer: nalquas <nalquas.dev@gmail.com>

pkgname=libre-trainsim-bin
pkgver=0.8
pkgrel=1
pkgdesc="Free Train Simulator for everyone"
arch=('x86_64' 'i686')
url="https://www.libretrainsim.org/"
license=('GPL3')
depends=('libxcursor' 'libxi' 'libxrandr' 'hicolor-icon-theme' 'libglvnd' 'libxinerama') # determined using namcap
provides=('libre-trainsim')
source=("https://github.com/flathub/org.libretrainsim.Libre-TrainSim/raw/9add6d0bbf6afe8c36905af4dac4a1e82148c3a3/icon.png")
sha256sums=('56644aa06416b35c3ce1499ec822822b38749cfc8a554be2247de1e02360c451')
source_x86_64=("$pkgname-64-$pkgver.zip::https://github.com/Libre-TrainSim/Libre-TrainSim/releases/download/v0.8/Libre_TrainSim_Linux64_v0-8.zip")
sha256sums_x86_64=('179255021d45e812eccfe014ab2cd8c978bf8a03f30e29ba0602c8ccd598cf57')
source_i686=("$pkgname-32-$pkgver.zip::https://github.com/Libre-TrainSim/Libre-TrainSim/releases/download/v0.8/Libre_TrainSim_Linux32_v0-8.zip")
sha256sums_i686=('fc61bdb549f00c7bbac15c43f2aa9e15c85098372c0e46c159bbacdbff3e7b5e')

package() {
	# Navigate into the extracted zip directory
	cd Libre_TrainSim_Linux64_v0-8

	# Install the executable
	if [ "$CARCH" = 'x86_64' ]; then
		install -Dm755 Libre_TrainSim.x86_64 "$pkgdir/usr/share/libre-trainsim/Libre_TrainSim.x86_64"
	elif [ "$CARCH" = 'i686' ]; then
		install -Dm755 Libre_TrainSim.x86 "$pkgdir/usr/share/libre-trainsim/Libre_TrainSim.x86"
	fi

	# Install the .pck's
	install -Dm644 Libre_TrainSim.pck "$pkgdir/usr/share/libre-trainsim/Libre_TrainSim.pck"
	install -Dm644 Hainfurt.pck "$pkgdir/usr/share/libre-trainsim/Hainfurt.pck"
	install -Dm644 U2-Nuremberg.pck "$pkgdir/usr/share/libre-trainsim/U2-Nuremberg.pck"

	# Return to upper level
	cd ..

	# Install the icon from the official flatpak git repository (https://github.com/flathub/org.libretrainsim.Libre-TrainSim/)
	install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/Libre-TrainSim.png"

	# Create a runner to allow for easy launching of the game from command line
	touch libre-trainsim
	if [ "$CARCH" = 'x86_64' ]; then
		echo """#!/bin/sh

# Run the game with its folder as working directory
# (required to get the .pck's to load)
(cd /usr/share/libre-trainsim && exec /usr/share/libre-trainsim/Libre_TrainSim.x86_64)""" >> libre-trainsim
	elif [ "$CARCH" = 'i686' ]; then
		echo """#!/bin/sh

# Run the game with its folder as working directory
# (required to get the .pck's to load)
(cd /usr/share/libre-trainsim && exec /usr/share/libre-trainsim/Libre_TrainSim.x86)""" >> libre-trainsim
	fi
	install -Dm755 libre-trainsim "$pkgdir/usr/bin/libre-trainsim"

	# Finally, create and install a .desktop file
	touch Libre-TrainSim.desktop
	echo """[Desktop Entry]
Type=Application
Name=Libre TrainSim
Comment=Free Train Simulator for everyone
Categories=Game;Simulation;
Icon=Libre-TrainSim
Exec=libre-trainsim
Terminal=false""" >> Libre-TrainSim.desktop
	install -Dm644 Libre-TrainSim.desktop "$pkgdir/usr/share/applications/Libre-TrainSim.desktop"
}
