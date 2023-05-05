# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Kristian Setälä
pkgname=evdevremapkeys-git
pkgver=r49.9b6f372
pkgrel=3
pkgdesc="A daemon to remap key events on linux input devices."
arch=('any')
url="https://github.com/philipl/evdevremapkeys"
license=('MIT')
depends=('python-pyudev' 'python-yaml' 'python-evdev' 'python-pyxdg')
makedepends=('git' 'python' 'patchelf' 'python-build' 'python-installer' 'python-wheel')
# 'python-virtualenv' # Needed if ./build-binary.sh is used
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://github.com/philipl/evdevremapkeys')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
	
	#python setup.py build # Alternative
	
	# ./build-binary.sh # Broken, see https://aur.archlinux.org/packages/evdevremapkeys-git#comment-865027
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
	
	#python setup.py install --root="$pkgdir" --optimize=1 # Alternative
	
	# install -D -m 755 "$srcdir/${pkgname%-git}/dist/evdevremapkeys" "$pkgdir/usr/bin/evdevremapkeys" # Belongs to broken installation method, see https://aur.archlinux.org/packages/evdevremapkeys-git#comment-865027

	install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname%-git}"
	for _docfile in examples/* README.md RUNNING.md; do
	  install -v -m644 -D "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_docfile}"
	done
	install -v -m644 -D 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT.txt"
}
