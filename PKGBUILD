# Maintainer: Vincent Pasquier <vincentpasquier@posteo.net>
_pkgname=rpi-rgb-led-matrix
pkgbase="${_pkgname}"
pkgname="${_pkgname}-git"
pkgver=1
pkgrel=3
pkgdesc="C++ library to draw on led matrix. Python, C, C++ APIs." arch=("armv7h" "armv6h" "aarch64")
url="https://github.com/hzeller"
license=('GPL')
optdepends=("python" "python-pillow")
makedepends=("python" "python-setuptools")
source=("git+https://github.com/hzeller/${_pkgname}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	make all
	PYTHON=$(which python3) make build-python
}

package() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/fonts/misc"

	install -D -m644 "lib/librgbmatrix.a" "${pkgdir}/usr/lib/librgbmatrix.a"
	install -D -m644 "lib/librgbmatrix.so.1" "${pkgdir}/usr/lib/librgbmatrix.so.1"
	install -D -m644 include/*.h "${pkgdir}/usr/include/"
	install -D -m644 fonts/*.bdf "${pkgdir}/usr/share/fonts/misc/"

	cd bindings/python
	python3 setup.py install --root="${pkgdir}/" --optimize=1
}
