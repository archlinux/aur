# Maintainer: kinker31<dp223171@gmail.com>
# Maintainer: JustinWayland<justintwayland@gmail.com>
pkgname=helion-git
pkgver=0.9.8.0.r103.g7c08a18
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind (git version)"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=(' GPL-3.0-or-later')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('libsndfile' 'mpg123' 'gcc-libs' 'alsa-lib' 'glibc' 'glib2') # Every other dependency is statically linked into the executable
makedepends=('dotnet-sdk>=10.0' 'clang' 'git')
provides=(helion)
conflicts=(helion)
source=("git+https://github.com/Helion-Engine/Helion")
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
		-p:AOT=true
}
package() {
	cd "Helion"
	mkdir -m=755 -p "$pkgdir"/usr/share/Helion/SoundFonts
	install -Dm755 ./Publish/linux-x64_AOT/Helion "$pkgdir"/usr/bin/Helion
	install -Dm644 ./Publish/linux-x64_AOT/assets.pk3 "$pkgdir"/usr/share/Helion/assets.pk3
	install -Dm644 ./Publish/linux-x64_AOT/README.md "$pkgdir"/usr/share/Helion/README.md
	install -Dm644 ./Publish/linux-x64_AOT/SoundFonts/Default.sf2 "$pkgdir"/usr/share/Helion/SoundFonts/Default.sf2
	mkdir -m=755 -p "$pkgdir"/usr/share/applications/ && mkdir -m=755 -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
	install -Dm755 ./Assets/Misc/Helion.desktop "$pkgdir"/usr/share/applications/Helion.desktop
	install -Dm644 ./Assets/Misc/helion.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Helion.svg
}
