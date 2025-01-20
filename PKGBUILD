# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
_pkgname=brux-gdk
pkgname=brux-gdk-git
pkgver=0.2.11.r210.g70ce705
pkgrel=4
pkgdesc="A free runtime and development kit using SDL and Squirrel"

arch=(any)

url="https://github.com/KelvinShadewing/brux-gdk"
license=('AGPL-3.0-only')

depends=(
	'physfs'
	'sdl2'
	'sdl2_gfx'
	'sdl2_image'
	'sdl2_net'
)

makedepends=(
	'base-devel'
	'git'
	'cmake'
)

provides=("brux-gdk")
conflicts=("brux-gdk")

source=("$_pkgname::git+$url.git#branch=unstable")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname/rte"

	local tag
	tag=$(git describe --tags --abbrev=0)

	# Get the number of commits since the last tag
	local commits
	commits=$(git rev-list "${tag}..HEAD" --count)

	# Get the current commit hash (abbreviated)
	local commit_hash
	commit_hash=$(git rev-parse --short HEAD)

	# Remove the 'v' prefix if it exists
	tag=${tag#v}

	# Construct the version string
	echo "${tag}.r${commits}.g${commit_hash}"
}

prepare() {
	cd "$_pkgname/rte"
	git submodule update --init --recursive
}

build() {
	cmake -B build -S $_pkgname/rte -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

	cmake --build build
}

package() {
	cmake --install build

	if [ "$pkgdir" != "" ]; then
		rm -rf "$pkgdir/home"
	fi

	install -Dm755 build/brux "$pkgdir/usr/bin/brux"
}
