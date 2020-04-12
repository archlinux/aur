# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli-git
pkgver=r69.632ffcf
pkgrel=1
pkgdesc="Play ai dungeon on your terminal"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml")
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
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$pkgname"

	# Using system installed python-setuptool-git-ver
	sed -i \
		-e 's/\(import.*\)/\1\nfrom setuptools_git_ver import version_from_git/' \
		-e 's/setup_requires.*//' \
		-e 's/version_format.*/version=version_from_git(),/' setup.py
}

build() {
	cd "$pkgname"

	python setup.py build
}

package() {
	cd "$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
