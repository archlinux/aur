# Maintainer: BrainDamage
pkgname="comic-dl"
pkgver=2019.05.26
pkgrel=4
pkgdesc="Comic-dl is a command line tool to download Comics and Manga from various Manga and Comic sites easily."
arch=(any)
url="https://github.com/Xonshiz/comic-dl"
license=("MIT")
optdepends=('phantomjs: to access some sites')
depends=("python" "python-tqdm" "python-requests" "python-cfscrape" "python-clint" "img2pdf" "python-colorama")
sha256sums=('31cfc7b2d9e200ad2790b9b22f2bd69a1cea4817957d394bf3907838d3567eb0')
source=("https://github.com/Xonshiz/comic-dl/archive/$pkgver.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed --in-place s/"'comic_dl.sites'"/"'comic_dl.sites', 'comic_dl.readcomiconline'"/ setup.py
	printf '%s\n' '#!/bin/env bash' >> comic-dl
	printf 'python %s/comic_dl/__main__.py $*' "$(python -c 'import site; print(site.getsitepackages()[0])')" >> comic-dl
	chmod +x comic-dl
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	mkdir -p "$pkgdir"/usr/bin/
	cp comic-dl "$pkgdir"/usr/bin/comic-dl
}

