# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='blender-plugin-cad-sketcher-git'
pkgver=r269.e50b784
pkgrel=1
pkgdesc="Constraint-based geometry sketcher for blender "
arch=('any')
url="https://github.com/hlorus/CAD_Sketcher"
license=('GPL')
depends=('blender>=2.92' 'python-py-slvs')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {

	_version=$(blender --version | sed -E -n -e 's/.*([0-9]+\.[0-9]+)\.[0-9]+.*/\1/p')

	_addons="$pkgdir/usr/share/blender/$_version/scripts/addons/cad-sketcher"

	cd "$srcdir/$(ls -d */)"

	if [ ! -d "$_addons" ]; then
		mkdir -p "$_addons"
	fi

	for i in *; do
		cp -r "$i" "$_addons"
	done
}
