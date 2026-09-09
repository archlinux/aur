# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
pkgname=wallhelper-git
_pkgname=wallhelper
pkgver=1.0.0
pkgrel=1
pkgdesc="One new photograph a day, and the ones you kept"
arch=('any')
url="https://github.com/jaehho/wallhelper"
license=('MIT')
# python-gobject, gtk4 and libadwaita are only needed by `wallhelper gui`; the
# fetch that runs from a systemd timer uses nothing but the standard library.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
optdepends=('hyprpaper: setting the wallpaper under Hyprland'
            'libnotify: desktop notifications'
            'xdg-desktop-portal: opening source pages and signup pages')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local desc
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		# tagged: v1.2.3-4-gabcdef -> 1.2.3.r4.gabcdef
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		# no tags yet: 1.0.0.r<commits>.g<short>
		printf '1.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	# The suite deletes files, so it insists on being pointed at a scratch
	# collection; -t . is what imports the tests package that does the pointing.
	python -m unittest discover -s tests -t .
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 packaging/dev.jaeho.Wallhelper.desktop \
		"$pkgdir/usr/share/applications/dev.jaeho.Wallhelper.desktop"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
