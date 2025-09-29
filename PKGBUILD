# Maintainer: lpt <aur AT lucapetrucci DOT net>

pkgname=youtube-local
pkgver=2.8.12
pkgrel=2
pkgdesc="Browser based client for watching YouTube anonymously and with greater page performance"
url="https://github.com/user234683/youtube-local"
license=("custom")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"remove-portable-mode.patch"
	"youtube-local.service"
)
sha256sums=(
	"7cb252196d1461e3969439afb84c598cb11dca04c4e0742d0c7a3ed918233aab"
	"ce89efec6cac4db6f60cd3e02003c13e7a264f30f2b7d6797dd4efebc1a0f230"
	"ab7878c75eea2caac1c731ce2cb79193a19758f2c546f853793c9e2822752591"
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
	find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
	find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +

	install -Dm0755 -T /dev/stdin "$pkgdir/usr/bin/youtube-local" <<EOF
#!/bin/sh
exec python3 /opt/$pkgname/server.py "\$@"
EOF

	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/youtube-local.service"
}
