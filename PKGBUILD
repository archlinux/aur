# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Cravix <dr.neemous@gmail.com>

pkgname=python-pygame-sdl2
_dir=pygame_sdl2
pkgver=8.5.1.25123106
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
	'cython'
	'git'
	'python-setuptools'
)
source=("git+${url}.git#tag=renpy-${pkgver}")
b2sums=('4513869e80bdb97a13652275d7050fec89446b31fa6388ab7402952ee587c9f6216435e92eab479ff0e95b226445109f35515752575d412e3bcc37477f6eec55')

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
