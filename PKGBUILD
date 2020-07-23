# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli-gql-git
pkgver=0.3.1.r1.g54ad129
pkgrel=1
pkgdesc="Play ai dungeon on your terminal (Graphql branch)"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml" "python-gql")
makedepends=("python-setuptools-git-ver" "git")
checkdepends=()
optdepends=()
provides=(${pkgname%-gql-git})
conflicts=(${pkgname%-gql-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git#branch=v4.x")
noextract=()
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	# Using system installed python-setuptool-git-ver
	sed -i \
		-e 's/\(import.*\)/\1\nfrom setuptools_git_ver import version_from_git/' \
		-e 's/setup_requires.*//' \
		-e 's/version_format.*/version=version_from_git(),/' setup.py
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
