# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python38-pygit2
pkgver=1.11.0
pkgrel=1
pkgdesc='Python bindings for libgit2'
arch=('x86_64')
url="https://github.com/libgit2/pygit2"
license=('GPL2')
depends=('libgit2' 'libgit2.so' 'python38-cffi' 'python38-six' 'python38-cached-property')
makedepends=('cython' 'python38-build' 'python38-cffi' 'python38-installer' 'python38-setuptools' 'git' 'python38-six' 'python38-wheel')
checkdepends=('python38-pytest-runner')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b53797c5ea378200ffdf9a575d71649d4b657f2501bed332a2a22b3495d273f2')

prepare() {
	cd "pygit2-$pkgver"
	# Disable tests that do stuff online
	sed -i -e '/has_network/s/True/False/' test/utils.py
}

build() {
	cd "pygit2-$pkgver"
	python3.8 -m build -wn
}

check() {
	cd "pygit2-$pkgver"
	local _pyver=cpython-$(python3.8 -m 'import sys; print("".join(map(str, sys.version_info[:2])))')
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver" pytest
}

package() {
	cd "pygit2-$pkgver"
	LANG=en_US.UTF8 python3.8 -m installer -d "${pkgdir}" dist/*.whl
}
