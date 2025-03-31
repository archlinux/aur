# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion-git
pkgver=0.9.6.1.r129.g664657f
pkgrel=4
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=('GPL3')

# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=(openal
		fluidsynth
		sdl2
		glfw
		'zmusic>=1.1.8')

makedepends=('dotnet-runtime' 'clang')
conflicts=('helion')
source=("git+https://github.com/Helion-Engine/Helion"
		"helion.desktop"
		"helion.ico")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "Helion"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "Helion/Client"
	dotnet publish  \
		-c Release \
		-r linux-x64 \
		-p:SelfContainedRelease=true \
		-p:AOT=true
}

package() {
	cd "Helion/Publish/linux-x64_AOT/"
	
	# Helion doesn't check for native Linux directories at the moment, so /opt will have to do.
	#There might be a better way of going about this, but right now this works.
	mkdir -m=644 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libfluidsynth.so.3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libglfw.so.3.3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libSDL2.so "$pkgdir"/opt/Helion/
	install -Dm644 ./libzmusic.so "$pkgdir"/opt/Helion/
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=644 -p "$pkgdir"/bin
	ln -s "$pkgdir"/opt/Helion/Helion "$pkgdir"/bin/helion
	install -Dm644 "$srcdir"/helion.desktop "$pkgdir"/usr/share/applications/
	install -Dm644 "$srcdir"/helion.ico "$pkgdir"/usr/share/icons/
}
