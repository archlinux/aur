# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='python-gql-git'
pkgver=3.0.0a1.r1.g8fc378d
pkgrel=1
pkgdesc="Python GraphQL client"
arch=('any')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
url="https://github.com/graphql-python/gql"
license=('MIT')
depends=(
	'python-aiohttp'
	'python-graphql-core'
	'python-requests'
	'python-websockets'
	'python-yarl'
)
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
