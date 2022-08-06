# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=aurutilsutils-git
pkgver=r3.b404406
pkgrel=1
pkgdesc="Utilities extending aurutils"
arch=("any")
url="https://github.com/VorpalBlade/aurutilsutils"
license=('custom:ISC')
depends=(
	'aurutils'
	'python-appdirs'
	'python-more-itertools'
	'python-networkx'
	'python-prompt_toolkit'
	'python-yaml'
	'python-regex'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools-scm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('aurutilsutils::git+https://github.com/VorpalBlade/aurutilsutils.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 -t "$pkgdir/usr/share/zsh/site-functions/" completion/zsh/_* 
}
