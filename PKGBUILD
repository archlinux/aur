# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-hyprcursor-git
_reponame=Sweet
_pkgname=Sweet-cursors-hyprcursor
pkgver=r365.836b486
pkgrel=2
pkgdesc="Sweet cursor theme for hyprcursor"
arch=('x86_64')
url="https://github.com/EliverLara/$_reponame"
license=('GPL3')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
depends=('xcur2png'
         'hyprcursor')
optdepends=()
provides=("Sweet-cursors-hyprcursor")
conflicts=()
options=('!strip')
patch="cursors.patch"
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$_reponame
    patch -p1 -i ../../$patch
}

build() {
    cd "$srcdir/$_reponame/kde/cursors"

    # update xcursors
    chmod +x build.sh
    ./build.sh

    # extract xcursors
    cd Sweet-cursors
    hyprcursor-util -x . --resize bilinear

    # rename metadata
    cd ../extracted_Sweet-cursors/
    sed -i "s/name = Extracted Theme/name = $_pkgname/" manifest.hl
    sed -i "s/description = Automatically extracted with hyprcursor-util/description = $pkgdesc/" manifest.hl

    # generate hyprcursor theme
    hyprcursor-util -c .
}

package() {
    cd "$srcdir/$_reponame/kde"
    mkdir -p $pkgdir/usr/share/icons

    mv -f cursors/theme_$_pkgname cursors/$_pkgname
    mv -f cursors/$_pkgname $pkgdir/usr/share/icons
}

