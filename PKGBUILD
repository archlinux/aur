# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.9.6505
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=(glibc libx11 libxcursor libxinerama zlib libvorbis libxcb gcc-libs)
optdepends=('dotnet-sdk: Dotnet 8 SDK'
            'vulkan-driver: Vulkan graphics driver'
            'portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(https://vps2.flaxengine.com/store/builds/Package_1_09_06605/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
conflicts=(flax-git)
sha256sums=('add61cfddacc02760eb18709d0be1279bd9a2c35346c14c5e2725f470061b69c' '91b94472789e1762f5906b5599304a8ee7628a9b8593c96291907e8e528a6cc1')

package() {
	cd "$srcdir"
	echo "Extracting Editor..."
	mkdir -p "$pkgdir/opt/flax/"
	bsdtar -xf "FlaxEditorLinux.zip" -C "$pkgdir/opt/flax"
	echo "Extracting Platform files..."
	mkdir -p "$pkgdir/opt/flax/Source/Platforms/Linux"
	bsdtar -xf "Linux.zip" -C "$pkgdir/opt/flax/Source/Platforms/Linux"
	mkdir -p "$pkgdir/usr/bin/"
	ln -sf "/opt/flax/Binaries/Editor/Linux/Development/FlaxEditor" "$pkgdir/usr/bin/flax"
	echo "Extracting Desktop files..."
	cd "$startdir"
	bsdtar -xf "desktop_files.tar.gz" -C "$pkgdir/usr/"
	cp --no-preserve=mode,ownership ".run.sh" "$pkgdir/opt/flax/"
	chmod +x "$pkgdir/opt/flax/.run.sh"

	dotnet --list-sdks > /dev/null 2>/dev/null
	if [ $? -eq 0 ]; then
		_newest=0
		for _ver in $(dotnet --list-sdks | cut -b 1); do
			if [[ "$_ver" -gt "$_newest" ]]; then
				_newest=$_ver
			fi
		done
		if [[ $_newest -lt 8 ]]; then
			echo "Flax engine is using Dotnet 8 SDK. Older versions might cause problems."
			echo "Please upgrade throught pacman or manually install Dotnet 8 SDK & Runtime!"
		fi
	else
		echo "Command 'dotnet' wasn't detected. Do you have dotnet 8 installed and/or in \$PATH?"
		echo "Please install via pacman or manually Dotnet 8 SDK & Runtime!"
	fi
}
