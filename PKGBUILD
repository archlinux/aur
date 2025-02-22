# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=8bitdo-kbd-mapper
pkgname="$_pkgbase-git"
pkgver=0.2.r13.g996ed45
pkgrel=2
pkgdesc="Key mapper for 8BitDo's Retro Mechanical Keyboard"
arch=('x86_64')
url="https://github.com/goncalor/8bitdo-kbd-mapper"
license=('GPL-3.0')
depends=('python' 'python-pyusb')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/goncalor/8bitdo-kbd-mapper.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_pkgbase"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgbase"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 50-8bitdo-kdb.rules "$pkgdir/usr/lib/udev/rules.d/50-8bitdo-kdb.rules"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_basename/LICENSE.txt"
}
