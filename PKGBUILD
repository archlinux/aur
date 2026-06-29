# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyglet-git
_name=${pkgname#python-}
_name=${_name%-git}
pkgver=2.1.15.r1.g536b5cc0f
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD-3-Clause')
depends=(
	'glib2'
	'gstreamer'
	'python'
	'python-gobject'
	'python-pillow'
	# AUR
	'python-pyogg'
)
makedepends=(
	'git'
	'python-setuptools'
	'python-build'
	'python-flit-core'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'ffmpeg: provides audio&video support'
	'openal: live audio'
)
conflicts=('python-pyglet')
provides=('python-pyglet')
source=("${_name}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "${srcdir}/${_name}" clean -dfx
	cd "$srcdir/${_name}"
	sed -i 's|,<4||g' pyproject.toml
}

build() {
	cd "$srcdir/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
