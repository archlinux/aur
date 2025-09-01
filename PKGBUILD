# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion
pkgver=0.9.8.0
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=('GPL3')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('openal' 'fluidsynth' 'sdl2' 'glfw' 'zmusic>=1.1.8')
makedepends=('dotnet-runtime' 'clang')
conflicts=('helion-git' 'helion-bin')
source=("https://github.com/Helion-Engine/Helion/archive/refs/tags/${pkgver}.tar.gz" "helion.desktop" "helion.ico")
sha256sums=('cb893c0e92950919700dd3471ad7420fa44c1bc0a60ecff0f8148b62a796eec7' 'dd02c430e093c2cfcdfaedfc316975af8ac47883676a05c26ac0a22a6f1b9c6b' '9590d5b920d2350a9f4ed8311f3195e619ebb168841e7d783cb652d142182c82')
build() {
	cd "Helion-${pkgver}/Client"
	dotnet publish -c Release -r linux-x64 -p:AOT=true
}
package() {
	cd "Helion-${pkgver}/Publish/linux-x64_AOT/"
	#There might be a better way of going about this, but right now this works.
	mkdir -m=644 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=644 -p "$pkgdir"/usr/share/applications/
	install -Dm755 "$srcdir"/helion.desktop "$pkgdir"/usr/share/applications/helion.desktop
	install -Dm755 "$srcdir"/helion.ico "$pkgdir"/usr/share/pixmaps/helion.ico
}