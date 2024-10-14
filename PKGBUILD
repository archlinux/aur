# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-tui-git
pkgver=r572.9acdbb9
pkgrel=1
pkgdesc='Outscale Text User Interface'

arch=('any')
url='https://github.com/outscale-dev/osc-tui'
license=(BSD)

makedepends=('python-setuptools')
depends=(osc-sdk-python python-pyperclip autopep8 python-diagrams)

pkgver() {
  cd "${srcdir}/osc-tui"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+https://github.com/outscale-dev/osc-tui.git")
sha256sums=("SKIP")

build() {
	cd "${srcdir}/osc-tui"
	git submodule update --init
	git clone https://github.com/outscale/npyscreen.git
	cd npyscreen # we use our own fork of npyscreen (oscscreen), not compatible with upstream on
	python  ./setup.py build
	cd ..
	git clone https://github.com/outscale-mgo/osc-diagram.git
	cd osc-diagram
	python  ./setup.py build
	cd ..
	python ./setup.py build
}

package() {
	cd "${srcdir}/osc-tui"
	cd npyscreen # we use our own fork of npyscreen (oscscreen), not compatible with upstream on
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	cd ..
	cd osc-diagram
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	cd ..
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D "${srcdir}/osc-tui/LICENSE" "$pkgdir/usr/share/licenses/osc-tui/LICENSE"
}
