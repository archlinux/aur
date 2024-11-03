# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=onscripter-en-galladite27
_pkgname=ONScripter-EN
pkgver=2024_07_21
pkgrel=2
epoch=
pkgdesc="modern fork of onscripter-en, an opensource nscript interpreter"
arch=('x86_64')
url="https://github.com/Galladite27/ONScripter-EN"
license=('GPL-2.0-or-later' 'OFL-1.1')
depends=('sdl_ttf' 'sdl12-compat' 'sdl_image' 'libvorbis' 'sdl_mixer' 'libx11' 'bzip2' 'smpeg0' 'freetype2')
provides=('onscripter-en')
conflicts=('onscripter-en-git')
install=onscripter-en.install
source=("${url}/archive/refs/tags/${pkgver//_/-}.tar.gz" "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8644/genjyuugothic-x-20150607.zip" "configure.patch" "conv_shared.patch")
noextract=('genjyuugothic-x-20150607.zip')
sha256sums=('af61fac4833b717b4175b6a66969cf8ef4fc97f89b6255b0dcecac2bc9daec28' 'e4a0ea11b8155056ad2b678c8501b2e76dd99b8c8eb5363d396fe7c3079201b3' '238f32bf896a480285e46c8f3edf2641d8a1d328d1e0c803ffa7a7789348c35c' '040c3bc8d104bd1f23e2e24d01c649bead0ed070f0bb0f2e8873013fe6167507')

prepare() {
	cd "$_pkgname-${pkgver//_/-}"
	patch -i "../configure.patch"
	patch -p1 -i "../conv_shared.patch"
}

build() {
	cd "$_pkgname-${pkgver//_/-}"
	./configure --prefix=/usr
	make "all"
}

package() {
	cd "$_pkgname-${pkgver//_/-}"

	# Programs
	make DESTDIR="$pkgdir/" install

	# helper-program
	echo -e "#! /bin/sh\n\nonscripter-en -f /usr/share/onscripter-en/default.ttf " > "onscripter-en-play"
	install -Dm755 "onscripter-en-play" "${pkgdir}/usr/bin/"

	# Fonts
	cd ".."
	bsdtar -xf "genjyuugothic-x-20150607.zip" "GenJyuuGothicX-Monospace-Normal.ttf" "README_GenJyuu.txt" "SIL_Open_Font_License_1.1.txt"
	install -Dm644 "GenJyuuGothicX-Monospace-Normal.ttf" "${pkgdir}/usr/share/onscripter-en/default.ttf"
	install -Dm644 "README_GenJyuu.txt" "${pkgdir}/usr/share/onscripter-en/README_GenJyuu.txt"
	install -Dm644 "SIL_Open_Font_License_1.1.txt" "${pkgdir}/usr/share/licenses/onscripter-en-galladite27/SIL_Open_Font_License_1.1.txt"
}
