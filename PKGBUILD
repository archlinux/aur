# Maintainer: Fredrick Brennan <copypasteⒶkittens⊙ph>
VCS=git
pkgname="phomemo-tools-$VCS"
pkgver=r49.a97488f
pkgrel=1
pkgdesc="Tools for Phomemo M02/M110/M220 (&c.?) thermal printers"
arch=(any)
url="https://github.com/vivier/phomemo-tools"
license=('GPL3')
groups=('print')
depends=('bluez-cups' 'python-pybluez' 'python-pycups' 'python-pillow' 'python-pyserial' 'python-setuptools' 'python-pyusb')
makedepends=('git' 'bash')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://github.com/vivier/phomemo-tools.git')
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-$VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-$VCS}"
	make
}

package() {
	pushd "$srcdir/${pkgname%-$VCS}"
	make DESTDIR="$pkgdir/" install
    popd
    pushd "$pkgdir"
    mkdir -p usr/share/doc/phomemo-tools
    mv -v usr/share/phomemo/README.md usr/share/doc/phomemo-tools/README.md
    rm -v usr/share/phomemo/LICENSE
    mkdir -p usr/bin
    ln -s -v /usr/share/phomemo/phomemo-filter.py usr/bin/phomemo-filter
    popd
}
