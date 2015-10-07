pkgname=starcheat
epoch=9
pkgver=0.26
pkgrel=1
pkgdesc="Starbound player save editor and Python library"
arch=(any)
url="https://github.com/wizzomafizzo/starcheat"
license=("MIT")
depends=(python-pyqt5 python-pillow)
makedepends=(python dos2unix)
source=("https://github.com/wizzomafizzo/starcheat/archive/$pkgver.tar.gz"
"py-starbound.zip::https://github.com/blixt/py-starbound/archive/3adf5c8e35aa93603cf72dfe115808bc8372ca6a.zip"
"starcheat.desktop"
"starcheat.sh")
md5sums=('85f00a9de6933407af486ab305b8e35c'
         '45951b751eede3762d40ab2c64142a31'
         'ef05183a35e289f6e036068db0d8c30b'
         'b1bdefdf82633ee135ea8980304f5513')

prepare() {
	cd py-starbound-*
	find . -type f -exec dos2unix {} \;
	cp -r * ../starcheat-$pkgver/starcheat/starbound/
}
         
build() {
	cd starcheat-$pkgver
	./build.py -v
}

package() {
	cd starcheat-$pkgver
	install -Dm755 ../starcheat.sh "$pkgdir/usr/bin/starcheat"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/starcheat/LICENSE"
	install -Dm644 ../starcheat.desktop "$pkgdir/usr/share/applications/starcheat.desktop"
	install -Dm644 starcheat/images/starcheat_64.png "$pkgdir/usr/share/icons/starcheat.png"
	cd build
	find . -name '*.py' -exec install -Dm644 {} "$pkgdir/usr/share/starcheat/"{} \;
	cd ../starcheat/images/icons
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/starcheat/icons/"{} \;
	python -m compileall "$pkgdir/usr/share/starcheat"
  find $pkgdir -type f -exec sed -i "s|${srcdir}||g" {} \;
} 
