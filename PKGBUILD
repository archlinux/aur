# Maintainer: kinker31<dp223171@gmail.com>
# Maintainer: JustinWayland<justintwayland@gmail.com>
pkgname=helion
pkgver=0.9.9.0
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('libsndfile' 'mpg123' 'gcc-libs' 'alsa-lib' 'glibc' 'glib2')
#dotnet-sdk-10.0-bin is a temporary mesure until Arch updates Dotnet.
makedepends=('dotnet-sdk>=10.0' 'clang')
source=("https://github.com/Helion-Engine/Helion/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('07d4d46d180b7ad469f275bc8dbd74531e12676edda56dba6f8cddd3c41297f2')
build() {
	cd "Helion-${pkgver}/Client"
	dotnet publish -c Release -r linux-x64 -p:AOT=true
}
package() {
	cd "Helion-${pkgver}/Publish/linux-x64_AOT/"
	#There might be a better way of going about this, but right now this works.
	mkdir -m=755 -p "$pkgdir"/usr/share/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/usr/bin/Helion
	install -Dm644 ./assets.pk3 "$pkgdir"/usr/share/Helion/assets.pk3
	install -Dm644 ./README.md "$pkgdir"/usr/share/Helion/README.md
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/usr/share/Helion/SoundFonts/Default.sf2
	mkdir -m=755 -p "$pkgdir"/usr/share/applications/
	install -Dm755 "$srcdir"/Helion-${pkgver}/Assets/Misc/Helion.desktop "$pkgdir"/usr/share/applications/Helion.desktop
	install -Dm755 "$srcdir"/Helion-${pkgver}/Assets/Misc/helion.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Helion.svg
}
