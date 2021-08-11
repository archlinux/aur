# Maintainer: osch <oliver at luced de>
pkgname=binaural-vst-git
pkgver=1.0.r27.a793079
pkgrel=1
pkgdesc="A vst plugin that positions sound in a 3D space using Head-Related Transfer Functions (HRTF)."
arch=('x86_64')
url="https://github.com/twoz/binaural-vst"
license=('GPL3')
groups=('vst-plugins' 'pro-audio' )
makedepends=('git' 'lua' 'juce')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/twoz/binaural-vst.git")
noextract=()
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}
prepare() {
	cd "$srcdir/${pkgname%-git}"
	git am ../../0001-Projucer-file-for-Linux.patch
	git am ../../0001-Fix-compile-errors.patch
	git am ../../0001-include-external-file-kemar.bin-into-vst-module.patch
	cd source 
	lua kemarBinToC.lua
	cd ..
	Projucer --resave JUCE/binaural-vst.jucer
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd JUCE/Builds/LinuxMakefile/
	make CONFIG=Release
}


package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -t "$pkgdir/usr/lib/vst/"   -m "u=rwx,go=rx" JUCE/Builds/LinuxMakefile/build/binaural-vst.so
}
