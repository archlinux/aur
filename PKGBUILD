# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=youtube-local
pkgver=2.8.11
pkgrel=1
pkgdesc="Browser based client for watching YouTube anonymously and with greater page performance"
url="https://github.com/user234683/youtube-local"
license=("custom")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"remove-portable-mode.patch"
)
sha256sums=(
	"698a574f5c0032a75cb740b499a16a2d3b59d2e1958a705eca8488bb187cfb69"
	"d2e93b29437b263e1442397243bfcf885ff0589aab77cd5f580a2b408f86f904"
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
