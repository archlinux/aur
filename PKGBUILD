pkgname='python-zopfli-git'
pkgdesc='Python bindings for the Zopfli compressor'
pkgver=0.0.8.r0.gfdaf482
pkgrel=1
arch=('x86_64')
license=(Apache-2.0)
depends=(glibc python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
url=https://github.com/anthrotype/py-zopfli
source=("$pkgname::git+$url"
		'git+https://github.com/google/zopfli.git')
sha512sums=(SKIP SKIP)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "$pkgname"
	git submodule init
	git config submodule.zopfli.url "$srcdir/zopfli"
	git -c protocol.file.allow=always submodule update
}

build () {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package () {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
