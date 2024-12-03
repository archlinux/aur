# Maintainer: shtrophic <aur at shtrophic dot net>

_name="dt-apriltags"
pkgname="python-$_name-git"
pkgdesc="Duckietown python bindings to the apriltag library"
pkgver=3.4.2.r26.gbcf530b
pkgrel=2
arch=(any)
license=(MIT)
url="https://github.com/duckietown/lib-$_name"
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=(
	"apriltag" 
	'python-numpy'
)
provides=(python-dt-apriltags)
conflicts=(python-dt-apriltags)
source=("$_name::git+$url.git"
	"libapriltag.patch")
sha512sums=('SKIP'
            'b1b3c22366265bc02aa04a367bab5423a5b20fdb76f792886cefa5ec0b3e076b40e339a3ebfd2e7b6fc2f769660bb696fbd8131c280e97d344829488ba7a6377')

_apriltagver() {
	pacman -Q apriltag | sed 's/^apriltag //;s/-.*$//'
}

pkgver() {
	cd $_name
	echo -n "$(_apriltagver).r$(git describe --long --tags --abbrev=7 | sed 's/^[^-]*-//;s/-/./')"
}

prepare() {
	cd $_name
	patch -p1 < "$srcdir/libapriltag.patch"
	sed -i "s/^version = minidom.*/version = \"$(_apriltagver)\"/" setup.py
	truncate --no-create --size 0 MANIFEST.in
}

build() {
	cd $_name
	python -m build --wheel --no-isolation
}

package() {
	cd $_name
	python -m installer --destdir="$pkgdir" dist/*.whl
}

