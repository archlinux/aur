# Maintainer: pigt <pay2630 at gmail dot com>
pkgname=injection
pkgver=0.9.2
pkgrel=1
pkgdesc="A Python-based ASCII programming-puzzle game."
arch=('i686' 'x86_64')
url="https://schilcote.itch.io/injection"
license=('MIT')
depends=('python-pygame' 'python-pyperclip' 'python-rsa' 'python-numpy' 'cython' 'tk' 'python-dill')
makedepends=('unzip' 'curl' 'python-pip' )
source=(injection.sh injection.desktop icon.png INJECTION_${pkgver}_src.zip.md5)
md5sums=('5f21ca7a8891291e250f5296ba855324'
         'cf419413f1dda3dcae7c665c9bb4bf46'
         '2e6543984ecc80ddf57ed822b344e0e1'
         'd06f2f1c19813ef44a6a62f53c1331b9')

_release_url="https://schilcote.itch.io/injection/file/235400?after_download_lightbox=true"

prepare() {
	#Download url always changing to prevent hotlink. So we must deal with it.
	#url extraction code was copied from "after school"'s package.
	_dl_url=$(curl -s -XPOST "${_release_url}" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')
	curl "$_dl_url" -o "INJECTION_${pkgver}_src.zip"
	md5sum -c INJECTION_${pkgver}_src.zip.md5
	unzip INJECTION_${pkgver}_src.zip -d "$pkgname-$pkgver"
}

_python_depends=('pymsgbox' 'pygcurse')
build() {
	cd "$pkgname-$pkgver"

	#module that doesn't exist in repo.
	mkdir 'custom_packages'
	pip install -t 'custom_packages' ${_python_depends[*]}
	export PYTHONPATH='./custom_packages'

	#Build fx
	python setup.py build_ext
	cp build/lib*/* .
	rm -r build	
}

package() {
	mkdir -p "$pkgdir/usr/lib"
	cp -r "$pkgname-$pkgver" "$pkgdir/usr/lib/injection" #Program and assets.
	install -D -m644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/injection/LICENSE" #License.
	install -D -m755 "injection.sh" "$pkgdir/usr/lib/injection/injection.sh" #Launch script.
	mkdir "$pkgdir/usr/bin/"
	ln -s "/usr/lib/injection/injection.sh" "$pkgdir/usr/bin/injection"
	install -D -m644 "injection.desktop" "$pkgdir/usr/share/applications/injection.desktop"
	install -D -m644 "icon.png" "$pkgdir/usr/lib/injection/icon.png"
}
