# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli-git
pkgver=0.4.0.r1.g3d79539
pkgrel=1
pkgdesc="Play ai dungeon on your terminal"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml" "python-gql")
makedepends=("python-setuptools-git-ver" "git")
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
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

	# Deactivate hardcoded debug mode
	sed -i \
		"s/DEBUG = True/DEBUG = False/" \
		ai_dungeon_cli/__init__.py
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
