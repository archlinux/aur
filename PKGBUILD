# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=wlr-layout-ui-git
_pkgname=${pkgname%-git}
pkgver=r79.7aecc75
pkgrel=1
pkgdesc="GUI to configure your screens"
arch=('any')
url="https://github.com/fdev31/wlr-layout-ui"
license=('MIT')
depends=('python' 'python-pyglet' 'python-tomli' 'python-tomli-w' 'python-jeepney')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
optdepends=('wlr-randr: To apply the configuration on other wlroots systems'
            'hyprland: To apply the configuration on Hyprland (recommended)'
            'xorg-xrandr: To apply the configuration on X11')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "files/$_pkgname.desktop" \
		"$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
