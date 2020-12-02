# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli
pkgver=0.4.5
pkgrel=2
pkgdesc="Play ai dungeon on your terminal"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml" "python-gql")
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('f5a488784bf2d9248e23b2c02030deadbe4bb5db08c1cb29de3dc0eaa400032c')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# setuptools-git-version can't work outside a git repo.
	sed -i \
		-e "s/version_format.*/version=\"$pkgver\",/" \
		-e "s/setup_requires.*//" setup.py

	# Bad imports
	find ai_dungeon_cli \
		-name "*.py" \
		-exec sed -i \
		"s/\(from gql.*\), WebsocketsTransport\(.*\)/\1\2\nfrom gql.transport.websockets import WebsocketsTransport/" \
		{} \;
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
