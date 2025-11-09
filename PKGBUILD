# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=onscripter-en-galladite27
_pkgname=ONScripter-EN
pkgver=2025_06_08
pkgrel=3
epoch=
pkgdesc="modern fork of onscripter-en, an opensource nscript interpreter"
arch=('x86_64')
url="https://github.com/Galladite27/ONScripter-EN"
license=('GPL-2.0-or-later' 'OFL-1.1')
depends=('sdl_ttf' 'sdl12-compat' 'sdl_image' 'libvorbis' 'sdl_mixer' 'libx11' 'bzip2' 'smpeg0' 'freetype2')
optdepends=('onscripter-en-devkit-git: user guides, project templates, and apis for ONScripter-EN')
provides=('onscripter-en')
conflicts=('onscripter-en-git')
install=onscripter-en.install
source=("${url}/archive/refs/tags/${pkgver//_/-}.tar.gz" "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8644/genjyuugothic-x-20150607.zip")
noextract=('genjyuugothic-x-20150607.zip')
sha256sums=('29d15582fafebbd7c06feb598af74871f1a346397752e970c867360b367d47b8' 'e4a0ea11b8155056ad2b678c8501b2e76dd99b8c8eb5363d396fe7c3079201b3')

prepare() {
	cd "$_pkgname-${pkgver//_/-}"
}

build() {
	cd "$_pkgname-${pkgver//_/-}"
	./configure --prefix=/usr
	make "all"
}

package() {
	cd "$_pkgname-${pkgver//_/-}"

	# Programs
	make DESTDIR="$pkgdir" install

	# helper-program
	echo -e "#! /bin/sh\n\nonscripter-en -f /usr/share/onscripter-en/default.ttf " > "onscripter-en-play"
	install -Dm755 "onscripter-en-play" "${pkgdir}/usr/bin/"

	#manpages
	install -d "$pkgdir/usr/share/man/man1/"
	 cp -r ./tools/man/* "$pkgdir/usr/share/man/man1/"

	# Fonts
	cd ".."
	bsdtar -xf "genjyuugothic-x-20150607.zip" "GenJyuuGothicX-Monospace-Normal.ttf" "README_GenJyuu.txt" "SIL_Open_Font_License_1.1.txt"
	install -Dm644 "GenJyuuGothicX-Monospace-Normal.ttf" "${pkgdir}/usr/share/onscripter-en/default.ttf"
	install -Dm644 "README_GenJyuu.txt" "${pkgdir}/usr/share/onscripter-en/README_GenJyuu.txt"
	install -Dm644 "SIL_Open_Font_License_1.1.txt" "${pkgdir}/usr/share/licenses/onscripter-en-galladite27/SIL_Open_Font_License_1.1.txt"

}
