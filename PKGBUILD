# Maintainer: Midov <midov@midov.pl>

_name=matrixcli
pkgname=matrixcli-git
pkgver=2020.02.26
pkgrel=1
pkgdesc='simple matrix client based on the matrix-python-sdk'
arch=('any')
url='https://github.com/saadnpq/matrixcli'
license=('GPL3')
depends=('python')
provides=('matrixcli' 'matrix-python-sdk')
conflicts=('matrixcli' 'matrix-python-sdk')
source=("git://github.com/saadnpq/matrixcli.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	git log -1 --format="%cd" --date=short | sed 's/-/./g'
}

build() {
	cd "${_name}"
	git submodule update --init --recursive
	git submodule update --recursive --remote
	sed -i 's|/lib/systemd/user|/usr/lib/systemd/user|' setup.py

}

package() {
	cd "${_name}"
	python setup.py install --root="$pkgdir"
	cd "${srcdir}/${_name}/python-sdk/"
	python setup.py install --root="$pkgdir"
	install -Dm644 "${srcdir}"/"${_name}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${_name}"/
}

