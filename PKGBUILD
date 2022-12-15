# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-libnxctrl-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgdesc='Python Library Emulating Nintendo Switch Controllers'
pkgver=0.2.1.r0.g2ae6347
pkgrel=1
arch=('any')
url='https://github.com/Victrid/libnxctrl'
license=('GPL3')
depends=(
	'dbus-python'
	'python-aioconsole'
	'python-blessed'
	'python-cryptography'
	'python-eventlet'
	'python-flask'
	'python-flask-socketio'
	'python-hid'
	'python-psutil'
	'python-pynput'
	'python-setuptools')
optdepends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url"
        'poohl_joycontrol::git+https://github.com/poohl/joycontrol'
        'mart1nro_joycontrol::git+https://github.com/mart1nro/joycontrol'
        'nxbt::git+https://github.com/brikwerk/nxbt')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.Poohl_joycontrol.url "$srcdir/poohl_joycontrol"
	git config submodule.mart1no_joycontrol.url "$srcdir/mart1nro_joycontrol"
	git config submodule.nxbt.url "$srcdir/nxbt"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
