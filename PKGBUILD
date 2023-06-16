# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake
pkgname=python-$_pkgname
pkgver=2.4.1
pkgrel=2
pkgdesc="a generic task execution engine that allows shell and Python tasks to be run efficiently and in parallel while working within complex inter-task dependency constraints"
arch=(any)
url=https://github.com/openembedded/bitbake
makedepends=(python-installer python-build)
depends=(python-codegen python-pyinotify python-ply python-beautifulsoup4 python-simplediff)
license=(GPL2)
_py=py3
conflicts=(python-progressbar)
provides=(python-progressbar)
source=(
	"https://github.com/openembedded/bitbake/archive/refs/tags/$pkgver.tar.gz"
	pyproject.toml
)
sha256sums=(
	'2bbcdb9e40229022b3bd8a6828728f7eb80680ea76bbebe8264a58bf11caccfd'
	'c42206d05bbdad9dcbc2d5229643846179acf741d95c65cb84d324211bcedfb6'
)

prepare() {
	cp ../pyproject.toml "$srcdir/$_pkgname-$pkgver"
	cd "$srcdir/$_pkgname-$pkgver" || return 1

	# avoid bug `import bb.fetch2`
	sed -i '1iimport bb.event' lib/bb/__init__.py
	# avoid bug `import pysh`
	ln -sf bb/pysh lib/pysh

	sed -i '1ifrom shutil import which' lib/bb/server/process.py
	sed -i 's`os.path.realpath(os.path.dirname(__file__) + "/../../../bin/bitbake-server")`which("bitbake-server") if which("bitbake-server") else &`g' lib/bb/server/process.py
}

build() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	python -m build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1
	python -m installer --destdir="$pkgdir" dist/*.whl
}
