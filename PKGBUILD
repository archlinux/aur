# Maintainer: RangHo Lee <hibiki_love@rangho.moe>

pkgname=ttf-d2coding-git
pkgver=1.3.1
pkgrel=1
pkgdesc="Monospace Korean font collection for programming."
arch=('any')
url="https://github.com/naver/d2codingfont"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip' 'wget')
conflicts=('ttf-d2coding')
provides=('ttf-font' 'ttf-d2coding')
install=ttf.install



prepare() {
	cd "$srcdir"

	echo "Creating target zip file..."
	touch d2coding.zip
	echo "Fetching ZIP archive from GitHub..."
	curl -s "https://api.github.com/repos/naver/d2codingfont/releases/latest" \
	 | grep "browser_download_url" \
	 | cut -d '"' -f 4 \
	 | wget -i - -O d2coding.zip
	echo "Download complete."
	
	echo "Unzipping the target file..."
	unzip "d2coding.zip"
	echo "Renaming directories..."
	mv D2Coding* d2coding
}

pkgver() {
	curl -s "https://api.github.com/repos/naver/d2codingfont/releases/latest" \
	 | grep "tag_name" \
	 | cut -d '"' -f 4 \
	 | sed s/VER//
}

package() {
	cd "$srcdir"/d2coding
	install -dm 755 "$pkgdir"/usr/share/fonts/TTF
	install -m 644 ./D2Coding/*.ttc "$pkgdir"/usr/share/fonts/TTF/d2coding.ttc
	install -m 644 ./D2CodingLigature/*.ttc "$pkgdir"/usr/share/fonts/TTF/d2coding-ligature.ttc
}
