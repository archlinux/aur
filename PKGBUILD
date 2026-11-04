# Maintainer: levinit <levinit@outlook.com>

pkgname=fortune-mod-zh-gushici
pkgver=1.0.0
pkgrel=6
pkgdesc="Chinese poems for fortune-mod。用于fortune的中文古詩詞，收錄傳世經典詩詞、辭賦、駢文與富有韻律的短篇散文"
arch=(any)
url="https://github.com/levinit/fortune-zh-gushici"
license=('custom:public-domain')
depends=('fortune-mod')
makedepends=('opencc' 'python' 'python-yaml')
install="$pkgname.install"
source=("build.py::https://raw.githubusercontent.com/levinit/fortune-zh-gushici/main/build.py"
	"gushici.yaml::https://raw.githubusercontent.com/levinit/fortune-zh-gushici/main/gushici.yaml"
	"$pkgname.install")
sha256sums=('6c0fa676342566e24fb1cd36b800109ec80493c9976f041526f7040d667ba24d'
            'SKIP'
            'e0ed51b55622d33ce608f5ef17d4908349fb744b38795ab8f31642c9e9b0f010')

prepare() {
	# build.py uses Path(__file__).resolve().parent; makepkg symlinks would
	# resolve outside $srcdir, so work from real file copies.
	mkdir -p "$srcdir/buildtree"
	cp -L "$srcdir/build.py" "$srcdir/gushici.yaml" "$srcdir/buildtree/"
}

build() {
	cd "$srcdir/buildtree"
	python build.py --ansi
	strfile -c % data/gushici-cht data/gushici-cht.dat
	opencc -i data/gushici-cht -o data/gushici-chs -c t2s.json
	strfile -c % data/gushici-chs data/gushici-chs.dat
}

package() {
	cd "$srcdir/buildtree"
	install -dm755 "$pkgdir/usr/share/fortune"
	install -m644 data/gushici-cht data/gushici-chs "$pkgdir/usr/share/fortune/"
	strfile -c % "$pkgdir/usr/share/fortune/gushici-cht" "$pkgdir/usr/share/fortune/gushici-cht.dat"
	strfile -c % "$pkgdir/usr/share/fortune/gushici-chs" "$pkgdir/usr/share/fortune/gushici-chs.dat"
}
