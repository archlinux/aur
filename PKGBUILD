# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=python-fmf
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc='Flexible Metadata Format'
url='https://github.com/psss/fmf'
depends=('python-ruamel-yaml' 'python-filelock')
makedepends=('python-setuptools' 'python-docutils')
checkdepends=('python-pytest-runner' 'git')
provides=('fmf')
conflicts=('fmf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('a614293d6893cb36af73fc21cd90d691c96f5e659d7d350894f4eb29934b3724')

build() {
	cd "fmf-$pkgver"
	python setup.py build

	local _tmp=$(mktemp -d)
	cp docs/header.txt "$_tmp/man.rst"
	tail -n+7 README.rst >> "$_tmp/man.rst"
	rst2man "$_tmp/man.rst" > fmf.1
}

check() {
	cd "fmf-$pkgver"
	python setup.py pytest
}

package_python-fmf() {
	cd "fmf-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 fmf.1 -t "$pkgdir/usr/share/man/man1/"
}
