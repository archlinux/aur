# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=8bitdo-kbd-mapper
pkgname="$_pkgbase"
pkgver=0.2
pkgrel=1
pkgdesc="Key mapper for 8BitDo's Retro Mechanical Keyboard"
arch=('x86_64')
url="https://github.com/goncalor/8bitdo-kbd-mapper"
license=('GPL-3.0')
depends=('python' 'python-pyusb')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/goncalor/8bitdo-kbd-mapper.git#tag=v$pkgver")
sha256sums=('f63f4a9f8407a54e71097eee7af62a7eabcae2e99a341d676e5782c8f3b03e82')

prepare() {
	cd "$_pkgbase"

	sed -i 's/ \\ / \\\\ /' src/eightbdkbd/keys.py
}

build() {
	cd "$_pkgbase"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgbase"

	python -m installer --destdir="$pkgdir" dist/*.whl

	if [ -f 50-8bitdo-kdb.rules ]; then # for future versions
		install -Dm644 50-8bitdo-kdb.rules "$pkgdir/usr/lib/udev/rules.d/50-8bitdo-kdb.rules"
	fi

	if [ -f LICENSE.txt ]; then # for future versions
		install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE.txt"
	fi
}
