# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=invoke
pkgname=(invoke python2-invoke)
pkgver=0.15.0
pkgrel=1
pkgdesc="Task execution tool & library"
url="http://pyinvoke.org"
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/invoke/invoke-$pkgver.tar.gz"
        "invoke.bash::https://raw.githubusercontent.com/pyinvoke/invoke/$pkgver/completion/bash"
        "invoke.fish::https://raw.githubusercontent.com/pyinvoke/invoke/$pkgver/completion/fish"
        "invoke.zsh::https://raw.githubusercontent.com/pyinvoke/invoke/$pkgver/completion/zsh")

prepare() {
	cp -r $pkgbase-$pkgver $pkgbase-$pkgver-py2
}

build() {
	cd "$srcdir"/$pkgbase-$pkgver
	python setup.py build

	cd "$srcdir"/$pkgbase-$pkgver-py2
	python2 setup.py build
}

package_invoke() {
	depends=(python)

	cd "$srcdir"/$pkgbase-$pkgver
	rm -rf build/lib/invoke/vendor/yaml2
	python setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 "$srcdir"/invoke.bash \
		"$pkgdir"/usr/share/bash-completion/completions/invoke
	install -Dm644 "$srcdir"/invoke.fish \
		"$pkgdir"/usr/share/fish/completions/invoke.fish
	install -Dm644 "$srcdir"/invoke.zsh \
		"$pkgdir"/usr/share/zsh/site-functions/_invoke
}

package_python2-invoke() {
	depends=(python2)

	cd "$srcdir"/$pkgbase-$pkgver-py2
	rm -rf build/lib/invoke/vendor/yaml3
	python2 setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$pkgdir"/usr/bin
	mv inv inv2
	mv invoke invoke2
}

sha256sums=('0f98e515f94f6c67fc70eef0b34cd3d687f193e5c4df6482a29eb43b893caae7'
            '5c0fdc6b454253d117d71705a65922d74f2e8e56de905dcfee6460692e47e9ce'
            '58a7a1e82bf02afb74b0093ffd4f8f5045e7aa86dd6606e75d8a4ef69bc2dea6'
            '2fd9da1f67d2fbe48d0a3ddb570e2fad6600c29d1298ce017466edc688c576c7')
