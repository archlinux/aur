# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname="comic-dl"
pkgver=1.0.434
pkgrel=1
pkgdesc="Comic-dl is a command line tool to download Comics and Manga from various Manga and Comic sites easily."
arch=(any)
url="https://github.com/Xonshiz/${pkgname}"
license=("MIT")
optdepends=('phantomjs: to access some sites')
depends=("python" "python-tqdm" "python-requests" "python-cfscrape" "python-clint" "img2pdf" "python-colorama" "python-future" "python-beautifulsoup4" "python-cloudscraper" "phantomjs" "nodejs")
sha256sums=('70b9c0c7878651c685f7ba70a1ecef2905749988f2453d03730a17cd09547ca4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xonshiz/comic-dl/archive/$pkgver.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i 's/from comic_dl import __version__/#from comic_dl import __version__/' 'setup.py'
	sed -i "s/__version__\.__version__/\"${pkgver}\"/" 'setup.py'
	printf '%s\n' '#!/bin/sh' >> "${pkgname}"
	printf 'python %s/comic_dl/__main__.py "$@"' "$(python -c 'import site; print(site.getsitepackages()[0])')" >> "${pkgname}"
	chmod +x "${pkgname}"
	
	python 'setup.py' build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -Dm755 "${pkgname}" -t "$pkgdir"/usr/bin/
}

