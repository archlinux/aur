# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bollywood-git
pkgver=r9.31e1677
pkgrel=1
pkgdesc="Run terminal screencasts in multiple panes for a Hollywood-style hacking terminal"
arch=('any')
url="https://github.com/abloch/bollywood"
license=('LicenseRef-unknown')
depends=('bash' 'curl' 'zellij' 'asciinema')
makedepends=('git')
provides=('bollywood')
conflicts=('bollywood')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd bollywood
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd bollywood
	sed -i 's|"\./stam\.sh"|"/usr/lib/bollywood/stam.sh"|g' layout.kdl
}

package() {
	cd bollywood
	install -Dm755 stam.sh "$pkgdir/usr/lib/bollywood/stam.sh"
	install -Dm644 layout.kdl "$pkgdir/usr/share/bollywood/layout.kdl"
	install -Dm644 config.kdl "$pkgdir/usr/share/bollywood/config.kdl"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/bollywood" <<'LAUNCHER'
#!/bin/sh
exec zellij -l /usr/share/bollywood/layout.kdl --config /usr/share/bollywood/config.kdl "$@"
LAUNCHER

	install -Dm644 README.md "$pkgdir/usr/share/doc/bollywood/README.md"
}
