# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Cravix <dr.neemous@gmail.com>

pkgname=python-pygame-sdl2
_dir=pygame_sdl2
pkgver=8.3.7.25031702
pkgrel=1
epoch=1
pkgdesc='Reimplementation of portions of the pygame API using SDL2'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/renpy/${_dir}"
license=(
	'LGPL-2.1-or-later'
	'Zlib'
)
depends=(
	'python'
	'sdl2_image'
	'sdl2_mixer'
	'sdl2_ttf'
)
makedepends=(
	'cython0'
	'git'
	'python'
	'python-setuptools'
)
source=("git+${url}.git#tag=renpy-${pkgver}")
b2sums=('23c7476c8eee9350978cabacefa0a8d04adb6dc01387e9cb2a280c0850e9ec246b0e7b517cb8685b9d1ad39eb8baaa0c766fa901b0f2f01ebd883b659d4fba43')

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
	python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	install -dm755 "$pkgdir/usr/include/pygame_sdl2"
	cp -rf "${srcdir}/includes"/* "$pkgdir/usr/include/pygame_sdl2"
	install -Dm 644 'COPYING.ZLIB' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
