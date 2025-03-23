# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion-git
pkgver=0.9.6.1.r129.g664657f
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=('GPL3')
depends=(openal
		fluidsynth
		sdl2
		glfw
		'zmusic>=1.1.8')
makedepends=('dotnet-runtime' 'clang')
conflicts=('helion')
source=("git+https://github.com/Helion-Engine/Helion"
		"Helion.desktop"
		"helicon.ico")
sha256sums=('SKIP')

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
	mv Helion helion
	install -Dm 644 "./helion" "$pkgdir"/usr/bin/helion
	mkdir --parents "$pkgdir"/usr/share/helion/SoundFonts
	install -Dm 644 "./assets.pk3" "$pkgdir"/usr/share/helion/
	install -Dm 644 "./SoundFonts/Default.sf2" "$pkgdir"/usr/share/helion/SoundFonts
	chmod -R 755 "$pkgdir"/usr/share/helion/SoundFonts
	install -Dm 644 "$srcdir"/Helion.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 "$srcdir"/helion.ico -t "$pkgdir"/usr/share/pixmaps
}
