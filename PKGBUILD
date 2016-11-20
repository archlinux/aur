pkgname='python-zopfli-git'
pkgdesc='Python bindings for the Zopfli compressor'
pkgver=0.0.7.r2.gfdaf482
pkgrel=1
arch=('x86_64')
license=('Apache')
depends=('python')
makedepends=('git')
url='https://github.com/anthrotype/py-zopfli'
source=("${pkgname}::git+${url}"
	"zopfli::git+https://github.com/google/zopfli")
sha512sums=('SKIP' 'SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	git submodule init
	git config submodule.zopfli.url "${srcdir}/zopfli"
	git submodule update
}

build () {
	cd "${pkgname}"
	python3 setup.py build
}

package () {
	cd "${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
