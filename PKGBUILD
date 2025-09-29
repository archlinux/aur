# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
_pkgname=brux-gdk
pkgname=brux-gdk-git
pkgver=0.2.11.r308.gf5a4114
pkgrel=2
pkgdesc="A free runtime and development kit using SDL and Squirrel"

arch=('x86_64' 'riscv64' 'aarch64' 'i686' 'riscv32' 'armv7h')

url="https://codeberg.org/KelvinShadewing/brux-gdk"
license=('AGPL-3.0-only')

depends=(
	'physfs'
	'sdl2'
	'sdl2_gfx'
	'sdl2_image'
	'sdl2_mixer'
	'sdl2_net'
)

makedepends=(
	'base-devel'
	'cmake'
	'meson'
	'git'
)

provides=("brux-gdk")
conflicts=("brux-gdk")

source=("$_pkgname::git+$url.git#branch=main")
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
	meson setup build $_pkgname/rte --prefix /usr -Dbuildtype=release --wipe

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	if [ "$pkgdir" != "" ]; then
		rm -rf "$pkgdir/home" "$pkgdir/usr/lib" "$pkgdir/usr/test"
		rm "$pkgdir/usr/bin/sq" "$pkgdir/usr/bin/sq_static"

		mv "$pkgdir/usr/brux" "$pkgdir/usr/bin/brux"

		# Precaution
		rm -f "$pkgdir/usr/lib/libsquirrel*" "$pkgdir/usr/lib/libsqstd" "$pkgdir/usr/include/sq*"
	fi
}
