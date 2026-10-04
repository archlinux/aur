# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ptable-git
pkgver=r57.6c3f178
pkgrel=2
pkgdesc="A beautiful TUI periodic table for GNU/Linux terminals"
arch=('x86_64')
url="https://github.com/velorek1/ptable"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make' 'pkgconf')
provides=('ptable')
conflicts=('ptable')
source=("ptable::git+https://github.com/velorek1/ptable.git")
sha256sums=('SKIP')

pkgver() {
	cd ptable
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ptable
	make
}

package() {
	cd ptable
	install -Dm644 elements.dat "$pkgdir/usr/share/$pkgname/elements.dat"
	install -Dm755 tptable "$pkgdir/usr/lib/$pkgname/tptable"
	install -d "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/ptable" <<'EOF'
#!/bin/sh
cd /usr/share/ptable || exit 1
exec /usr/lib/ptable/tptable "$@"
EOF

	chmod 755 "$pkgdir/usr/bin/ptable"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 sc0.jpg "$pkgdir/usr/share/doc/$pkgname/sc0.jpg"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
