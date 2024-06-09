# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=youtube-local
pkgver=2.8.10
pkgrel=1
pkgdesc="Browser based client for watching YouTube anonymously and with greater page performance"
url="https://github.com/user234683/youtube-local"
license=("custom")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"remove-portable-mode.patch"
)
sha256sums=(
	"5afc9cfd6ef07984d17eca384a9e99ff3ca4dec5e2479ca409af0bec60327002"
	"d479daf59f4a073a7e7ba462b6932d7928c3876c5cc86eef9eeae74cf9fac761"
)
arch=("any")
depends=(
	"python-flask"
	"python-gevent"
	"python-brotli"
	"python-pysocks"
	"python-urllib3"
	"python-defusedxml"
	"python-cachetools"
	"python-stem"
)
checkdepends=("python-pytest")
provides=("youtube-local")
conflicts=("youtube-local-git")

check () {
	cd "$pkgname-$pkgver"
	python3 -m pytest
}

prepare () {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/remove-portable-mode.patch"
}

build () {
	cd "$pkgname-$pkgver"
	sed -n '/This project/,/ AGPLv3./p' README.md > LICENSE
}

package () {
	cd "$pkgname-$pkgver"

	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

	install -Dm0644 -t "$pkgdir/opt/$pkgname/" settings.py server.py
	rm -rf "youtube/__pycache__" "youtube/static/modules/plyr/build-instructions.md"
	cp -a youtube/ "$pkgdir/opt/$pkgname/"

	install -Dm0755 -T /dev/stdin "$pkgdir/usr/bin/youtube-local" <<EOF
#!/bin/sh
exec python3 /opt/$pkgname/server.py "\$@"
EOF
}
