# Maintainer: Totchi Lagawi <chatnoir420 at gmx dot com>
# Fomer maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.11.06802
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=(glibc libx11 libxcursor libxinerama zlib libvorbis libxcb gcc-libs)
makedepends=(dotnet-host)
optdepends=('dotnet-sdk: Dotnet 8 SDK'
            'vulkan-driver: Vulkan graphics driver'
            'portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(https://vps2.flaxengine.com/store/builds/Package_1_11_06802/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
conflicts=(flax-git)
sha256sums=('3a42f31c5b3e22f4074fbf6d549ce5a17aa7076e4286459dfbded16bff674960' '1373a181b3af08a827f128ffb33478c3e8e5f9179896f95720c6bb9ee7530c92')

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
