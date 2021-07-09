# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname="comic-dl"
pkgver=2021.06.13
_version="1.0.398"
pkgrel=1
pkgdesc="Comic-dl is a command line tool to download Comics and Manga from various Manga and Comic sites easily."
arch=(any)
url="https://github.com/Xonshiz/comic-dl"
license=("MIT")
optdepends=('phantomjs: to access some sites')
depends=("python" "python-tqdm" "python-requests" "python-cfscrape" "python-clint" "img2pdf" "python-colorama" "python-future" "python-beautifulsoup4" "python-cloudscraper" "phantomjs" "nodejs")
sha256sums=('bcf7a26b88552bc17b1ec4cd3d6bd7253f37959043fb07cfdc09d583c5e8f81f')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xonshiz/comic-dl/archive/$_version.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$_version"

	sed -i 's/from comic_dl import __version__/#from comic_dl import __version__/' 'setup.py'
	sed -i "s/__version__\.__version__/\"${_version}\"/" 'setup.py'
	printf '%s\n' '#!/bin/sh' >> 'comic-dl'
	printf 'python %s/comic_dl/__main__.py "$@"' "$(python -c 'import site; print(site.getsitepackages()[0])')" >> 'comic-dl'
	chmod +x 'comic-dl'
	
	python 'setup.py' build
}

package() {
	cd "$srcdir/$pkgname-$_version"
	
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -Dm755 'comic-dl' -t "$pkgdir"/usr/bin/
}

