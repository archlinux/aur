# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>
# shellcheck disable=SC2034,2154,2148

pkgname=python-mglib
pkgver=1.3.1
pkgrel=2
pkgdesc="Python Package containing modules shared across all Papermerge Project project"
arch=('any')
url="https://github.com/papermerge/mglib"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-magic')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18c81f63a4d9709f2a3c29afa48a83ac91f5eea2f13f0535d58445cd738be6f0')

prepare() {
	cd "mglib-$pkgver"
	sed -i '/packages=/s/()/(exclude=["*tests*"])/' setup.py
}

build() {
	cd "mglib-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: tests fail due to breaking changes in python-magic
# check() {
# 	cd "mglib-$pkgver"
# 	PYTHONPATH="$PWD" python test/run.py
# }

package() {
	export PYTHONHASHSEED=0
	cd "mglib-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/mglib-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
