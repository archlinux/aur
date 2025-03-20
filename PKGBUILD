# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Yann Büchau <nobodyinperson@posteo.de>

pkgname=hledger-utils-git
_pkgname=${pkgname%-git}
pkgver=1.14.0.r1.gd950b88
pkgrel=1
pkgdesc='Utilities extending the hledger plaintextaccounting tool'
arch=(any)
url="https://gitlab.com/nobodyinperson/$_pkgname"
license=(GPL-3.0-or-later)
_pydeps=(asteval
         cycler
         # drawilleplot
         matplotlib
         numpy
         pandas
         psutil
         rich
         scipy)
depends=(hledger
         python
        "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=(python-hledger-utils-git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver () {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$_pkgname"
	python -m build -wn
}

package () {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	local _py3_ver=$(python --version | cut -d " " -f2)
	rm -rf "$pkgdir/usr/lib/python${_py3_ver%.*}/site-packages/tests"
}
