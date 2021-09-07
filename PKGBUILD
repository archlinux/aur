# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pigt <pay2630 at gmail dot com>

pkgname=injection
pkgver=0.10.2
pkgrel=1
pkgdesc="Python-based ASCII programming-puzzle game"
arch=('x86_64')
url="https://toastengineer.itch.io/injection"
license=('MIT')
depends=(
	'cython'
	'python-dill'
	'python-numpy'
	'python-pygame>=1.9.4'
	'python-pyperclip'
	'python-rsa')
makedepends=('python-setuptools' 'python-pip')
source=(
	"$pkgname-$pkgver.tar.bz2::https://gitlab.com/toastengineer/injection/-/archive/master/INJECTION-master.tar.bz2"
	injection.sh
	injection.desktop
	icon.png)
sha256sums=('4fd7c3cbf32d09283d956ca42e92f2ffb97633956288d54bf0c6f0163b9461d5'
            '93fbcd694536f0a9928bcd4c274c5436998c8b0f6b527e7729007bd7c30dc7fe'
            '149b1700eddf2c0aba61a7bc9756ea9a464826478e6bf94bf23ea320781991b1'
            '1b4deae94db1a44d5ff4db9399b5038fe17d5cd45454eaa00f3f4925a49337be')

prepare() {
	mv INJECTION-master "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	#module that doesn't exist in repo.
	local _python_depends=('pymsgbox' 'pygcurse' 'pyconsolegraphics' 'pyerrorreport')
	mkdir -p 'custom_packages'
	pip install -t 'custom_packages' ${_python_depends[*]}
	export PYTHONPATH='./custom_packages'

	#Build fx
	python setup.py build_ext
	cp build/lib*/* .
	rm -r build
}

package() {
	install -d "$pkgdir/usr/lib" "$pkgdir/usr/bin/"
	cp -a --no-preserve=ownership "$pkgname-$pkgver" "$pkgdir/usr/lib/injection" #Program and assets.
	install -D -m644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -D -m755 "injection.sh" -t "$pkgdir/usr/lib/injection/"
	ln -s "/usr/lib/injection/injection.sh" "$pkgdir/usr/bin/injection"
	install -D -m644 "injection.desktop" -t "$pkgdir/usr/share/applications/"
	install -D -m644 "icon.png" -t "$pkgdir/usr/lib/injection/"
}
