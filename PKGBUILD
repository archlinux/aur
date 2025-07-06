# Maintainer: Juliette Cordor
pkgname=arctis-bat-git
pkgrel=1
pkgver=v0.2.0.r8.137323f
pkgdesc="CLI tool for checking SteelSeries Arctis headsets battery on linux"
license=(Apache-2.0)
arch=(x86_64)
source=("$pkgname::git+https://github.com/jewlexx/arctis-bat.git")
url="https://github.com/jewlexx/arctis-bat"
depends=(hidapi glibc)
makedepends=(meson ninja git)
sha1sums=('SKIP')
provides=(arctis-bat)
conflicts=(arctis-bat)

pkgver() {
    cd "$pkgname"
    local tag=$(git tag --sort=-v:refname | grep '^v[0-9]' | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
    local BUILD_DIR=builddir

    cd "$pkgname"
    meson subprojects download || return 1
}

build() {
    local BUILD_DIR=builddir

    arch-meson "$pkgname" "$BUILD_DIR" -Dcpu_native=true --optimization=3
    meson compile -C $BUILD_DIR
}

package() {
    local BUILD_DIR=builddir

    meson install -C $BUILD_DIR --destdir "$pkgdir"
}
