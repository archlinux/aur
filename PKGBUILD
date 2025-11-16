# Maintainer: kinker31<dp223171@gmail.com>
# Maintainer: JustinWayland<justintwayland@gmail.com>
pkgname=helion
pkgver=0.9.8.0
pkgrel=4
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('libsndfile' 'mpg123' 'gcc-libs' 'alsa-lib' 'glibc' 'glib2')
#dotnet-sdk-10.0-bin is a temporary mesure until Arch updates Dotnet.
makedepends=('dotnet-sdk>=10.0' 'clang')
source=("https://github.com/Helion-Engine/Helion/archive/refs/tags/${pkgver}.tar.gz" "change-desktop-target.patch")
sha256sums=('cb893c0e92950919700dd3471ad7420fa44c1bc0a60ecff0f8148b62a796eec7' 'e8c91f9941d7805494edc950aa2375423392c91b9a5abc664a687e7047bce811')
prepare() {
	cd "$srcdir/Helion-${pkgver}"
	patch -Np1 -i ../change-desktop-target.patch
}
build() {
	cd "Helion-${pkgver}/Client"
	dotnet publish -c Release -r linux-x64 -p:AOT=true
}
package() {
	cd "Helion-${pkgver}/Publish/linux-x64_AOT/"
	#There might be a better way of going about this, but right now this works.
	mkdir -m=755 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=755 -p "$pkgdir"/usr/share/applications/
	install -Dm755 "$srcdir"/Helion-${pkgver}/Assets/Misc/Helion.desktop "$pkgdir"/usr/share/applications/Helion.desktop
	install -Dm755 "$srcdir"/Helion-${pkgver}/Assets/Misc/helion.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Helion.svg
}
