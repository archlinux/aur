# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax-git
pkgver=1.5.6338.r336
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine "
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'zlib' 'libvorbis' 'mono')
makedepends=('clang' 'portaudio' 'git' 'git-lfs')
optdepends=('portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(git+https://github.com/FlaxEngine/FlaxEngine.git)
conflicts=(flax)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/FlaxEngine"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/FlaxEngine"
	"Development/Scripts/Linux/CallBuildTool.sh" \
		--deploy \
		--deployEditor \
		--deployPlatforms \
		--deployDontCompress \
		--deployOutput=Output \
		--arch=x64 \
		--platform=Linux \
		--log \
		--verbose
}

package() {
	cd "$srcdir/FlaxEngine/Output"
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin/"
	echo "Moving Editor..."
	mv "Editor" "$pkgdir/opt/flax"
	echo "Moving Platform files..."
	mv "Linux" "$pkgdir/opt/flax/Source/Platforms/"
	ln -sf "/opt/flax/Binaries/Editor/Linux/Development/FlaxEditor" "$pkgdir/usr/bin/flax"
	echo "Extracting Desktop files..."
	cd "$startdir"
	bsdtar -xf "desktop_files.tar.gz" -C "$pkgdir/usr/"
	cp --no-preserve=mode,ownership ".run.sh" "$pkgdir/opt/flax/"
	chmod +x "$pkgdir/opt/flax/.run.sh"
}
