# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=youtube-local
pkgver=2.8.6
pkgrel=1
pkgdesc="browser-based client for watching Youtube anonymously and with greater page performance"
url="https://github.com/user234683/youtube-local"
license=("AGPL-3.0-or-later")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/user234683/youtube-local/archive/refs/tags/v$pkgver.tar.gz"
	"remove-portable-mode.patch"
)
sha256sums=(
	"0a7840400f2aa9367c68b6628a8c243491abd6b3a0ad247743111672274a8f79"
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

package () {
	cd "$pkgname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/opt/$pkgname/" settings.py server.py
	rm -rf "youtube/__pycache__" "youtube/static/modules/plyr/build-instructions.md"
	cp -a youtube/ "$pkgdir/opt/$pkgname/"
	install -Dm0755 -T /dev/stdin "$pkgdir/usr/bin/youtube-local" <<EOF
#!/bin/sh
exec python3 /opt/$pkgname/server.py
EOF
}
