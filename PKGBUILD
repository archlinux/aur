# Maintainer: Guillaume Hayot <ghayot@postblue.info>
_pkgname=funkwhale-cli
pkgname=${_pkgname}-git
pkgver=r121.4767d1a
pkgdesc="A command line interface to interact with Funkwhale servers"
pkgrel=1
epoch=2
arch=('any')
url="https://dev.funkwhale.audio/funkwhale/cli"
license=('AGPL')
depends=('python>=3.6' 'python-keyring' 'python-click-log' 'python-dotenv' 'python-marshmallow' 'python-semver' 'python-tabulate')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('funkwhale-cli')
provides=("funkwhale-cli=${pkgver}")
source=('funkwhale-cli::git+https://dev.funkwhale.audio/funkwhale/cli.git'
	'keyrings.patch'
	'oauth.patch')
noextract=()
sha256sums=('SKIP'
            'b9561fed8b9f5a5b4e317b0c29ce2ce034a4b15426ed9a35dd503ce6da970c36'
            '6033ae064004b551c0159e66de8934bdeb2e706c0951330f7250b0a1308dd669')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	git -C "$srcdir/${pkgname%-git}" clean -dfx
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/oauth.patch"
	patch -p1 -i "$srcdir/keyrings.patch"
}	

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
