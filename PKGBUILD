# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=gamera
_srcname=gamera-4
pkgver=4.1.0
pkgrel=1
pkgdesc='Framework for building document analysis applications'
arch=(x86_64)
url="https://github.com/hsnr-gamera/$_srcname"
license=('GPL-2.0-or-later')
depends=(
	'python>=3.5'
	'gtk3'
	'libtiff>=3.5'
	'libpng>=1.2'
	'python-wxpython>=4'
	'python-docutils'
	'python-numpy'
	'python-pillow'
	'python-packaging'
	'python-pygments'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
)
source=(
	"${_srcname}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'invalid_escape.patch'
)

prepare(){
	for p in *.patch ; do patch -p0 < "$p" ; done
}

check(){
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	local tmpdir="$(mktemp -d)"
    cd "$_srcname-$pkgver"
    ln -s "$tmpdir" tmp
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
    rm -rf "$tmpdir"
    rm tmp
}

build() {
    cd "$_srcname-$pkgver"
    python setup.py build
}

package() {
    cd "$_srcname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    cd "$pkgdir/usr/lib/python"*"/site-packages"
    for d in *
    do
		case "$d" in
		(gamera*) ;;
		(*) rm -rf "$d" ;;
		esac
	done
}

sha256sums=('ceac5c1ba5798817b0e46b2113a2c3fe087e0386eb5e24b17a8e51b41533caea'
            'a02243aff6dd2efffdf41d6ed41ee6960a7769a01986d22393cf471223c2f4eb')
