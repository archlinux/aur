# Maintainer: kinker31<dp223171@gmail.com>
# Maintainer: JustinWayland<justintwayland@gmail.com>
pkgname=helion
pkgver=0.9.8.0
pkgrel=3
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('libsndfile' 'mpg123' 'gcc-libs' 'alsa-lib' 'glibc' 'glib2')
makedepends=('dotnet-sdk>=9.0' 'clang')
source=("https://github.com/Helion-Engine/Helion/archive/refs/tags/${pkgver}.tar.gz" "change-desktop-target.patch")
sha256sums=('cb893c0e92950919700dd3471ad7420fa44c1bc0a60ecff0f8148b62a796eec7' '55fbacd2387b4a70878731969fa044bcf91cdd6f1c03138606336fee7acd8f89')
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
