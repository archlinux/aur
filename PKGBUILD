# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=python-pygame-sdl2
pkgname=${_pkgname}-git
_dir=pygame_sdl2
pkgver=2.1.0.r495.f8e5dbb
pkgrel=1
pkgdesc="SDL2-based implementation of the Pygame API"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/renpy/$_dir"
license=('LGPL-2.1-or-later' 'Zlib')
depends=('python' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cython' 'git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$_dir"
	version="$(cat 'src/pygame_sdl2/version.py' | grep '^vernum = ' | sed 's/^vernum = //; s/(//; s/)//; s/, /./g')"
	echo "${version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_dir"
	sed -i "s|headers_dir = pathlib.Path(sysconfig.get_paths()\\['include'\\]) / \"pygame_sdl2\"|headers_dir = pathlib.Path(\"${srcdir}/includes\")|" 'setup.py'
}

build() {
	cd "$_dir"
	python setup.py build
}

package() {
	cd "$_dir"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -dm755 "$pkgdir/usr/include/pygame_sdl2"
	cp -rf "${srcdir}/includes"/* "$pkgdir/usr/include/pygame_sdl2"
	install -Dm644 'COPYING.ZLIB' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.zlib"
}
