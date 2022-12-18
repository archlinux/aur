# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=python-pymisp
_pkg="${pkgname#python-}"
pkgver=2.4.166
pkgrel=1
pkgdesc="Python library to access MISP platforms via their REST API"
arch=('any')
url="https://github.com/MISP/PyMISP"
license=('BSD')
depends=(
	'python-dateutil'
	'python-deprecated'
	'python-jsonschema'
	'python-requests'
	'python>=3.8')
optdepends=(
	'lief: python-pymisp[fileobjects] support'
	'python-beautifulsoup4: python-pymisp[openioc] support'
	'python-chardet: python-pymisp[url] support'
	'python-magic: python-pymisp[fileobjects] support'
	'python-oletools: python-pymisp[email] support'
	'python-pyfaup: python-pymisp[url] support'
	'python-recommonmark: python-pymisp[docs] support'
	'python-urllib3: python-pymisp[brotli] support'
	'python-validators: python-pymisp[virustotal] support'
  'python-reportlab: python-pymisp[reportlab] support')
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-poetry-core'
	'python-setuptools'
	'python-wheel')
changelog=CHANGELOG.txt
source=("$pkgname::git+$url#tag=v$pkgver?signed"
        'remove-datafiles.patch')
sha256sums=('SKIP'
            'e97b356e9e3f8af08bb19c4c2356ed7f729b6a3d652b85f9ff4fb263763bb0fc')
validpgpkeys=('8647F5A7FFD350AE38B6E22F32E4E1C133B3792F') # Raphael Vinot

prepare() {
	patch -p1 -d "$pkgname" < remove-datafiles.patch
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

## Requires an active MISP instance
# check() {
# 	cd "$pkgname"
# 	nosetests
# }

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
