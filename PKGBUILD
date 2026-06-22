# Maintainer: Egor3f <ef@efprojects.com>
pkgname=konsole-companion-git
_pkgname=konsole-companion
pkgver=0.1.0.r1.g95e39eb
pkgrel=1
pkgdesc="Theme-synced profiles and tab-set manager for KDE Konsole"
arch=('any')
url="https://github.com/Egor3f/konsole-companion"
license=('WTFPL')
depends=('python' 'pyside6' 'konsole')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 data/konsole-companion.desktop \
		"$pkgdir/usr/share/applications/konsole-companion.desktop"
	install -Dm644 data/konsole-companion-daemon.service \
		"$pkgdir/usr/lib/systemd/user/konsole-companion-daemon.service"
	sed -i 's|%h/.local/bin/konsole-companion-daemon|/usr/bin/konsole-companion-daemon|' \
		"$pkgdir/usr/lib/systemd/user/konsole-companion-daemon.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
