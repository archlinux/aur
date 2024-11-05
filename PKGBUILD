# Maintainer: envolution
# Contributor: Alexey Trifonov <otaku [at] rambler dot ru>
# Contributor: Tesx <tesfabpel@gmail.com>
pkgname=goxel-voxel-editor-git
pkgver=+r5+b6a3e85cc
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux. Git version."
arch=('i686' 'x86_64')
url="https://goxel.xyz/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config)
depends=(glfw gtk3)
provides=('goxel-voxel-editor')
conflicts=('goxel-voxel-editor')
source=(
	"git+https://github.com/guillaumechereau/goxel.git"
    "goxel.desktop"
)
sha256sums=('SKIP'
            '9b29df7405a9593396bc7ea810dc2871cce7c4ee474c1fa56d32f56c2ca2d921')

_gitname=goxel

pkgver(){
  cd "$srcdir/$_pkgname"
  _version=$(git tag --sort=-v:refname --list | grep '^[0-9.]*$' | head -n1 )
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+${_short_commit_hash}"
}

build() {
	# don't fail on warnings:
	CFLAGS="${CFLAGS} -Wno-all"
	CXXFLAGS="${CFLAGS}"

	cd $_gitname
	make release
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"
	install -Dm644 goxel/icon.png "$pkgdir/usr/share/icons/goxel.png"

	cd $_gitname
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

# vim: ts=2 sw=2 et:
