# Maintainer: Andrej Radović <r.andrej@gmail.com>

_name=litecli
pkgname=${_name}-git
pkgver=r323.9d5bcf0
pkgrel=1
pkgdesc="A command-line client for SQLite databases that has auto-completion ""\
and syntax highlighting."
url="https://github.com/dbcli/litecli"
arch=(any)
license=('BSD')
depends=(
	'python'
	'python-click'
	'python-pygments'
	'python-prompt_toolkit'
	'python-sqlparse'
	'python-configobj'
	'python-cli_helpers'
)
makedepends=(python-build python-installer python-wheel)
source=("git+https://github.com/dbcli/litecli.git")
md5sums=('SKIP')
provides=('litecli')
conflicts=('litecli')

pkgver() {
	cd "$_name"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
