# Maintainer: Dylan Sandall <thebudman6@proton.me>
pkgname=wingman-git
_pkgname=wingman
pkgver=0.1.4.r0.g0000000
pkgrel=1
pkgdesc="Run multiple NetBird networks on one machine at once — isolated configs, sockets, and WireGuard interfaces"
arch=('any')
url="https://github.com/dsandall/wingman"
license=('MIT')
# netbird is provided by the AUR package of the same name (wingman shells out
# to the `netbird` binary and is non-functional without it).
depends=('python' 'python-typer' 'netbird')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('wingman')
conflicts=('wingman')
source=("$_pkgname::git+https://github.com/dsandall/wingman.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# <pyproject version>.r<commit count>.g<short sha> — base version stays the
	# single source of truth in pyproject.toml.
	local base
	base=$(grep -m1 '^version' pyproject.toml | sed -E 's/.*"(.*)".*/\1/')
	printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
