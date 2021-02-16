pkgname=revc-git
pkgver=1
pkgrel=1
pkgdesc="Grand Theft Auto Vice City reverse engineered"
arch=('x86_64')
depends=('openal' 'glew' 'glfw' 'libsndfile' 'mpg123')
makedepends=('git' 'cmake')
provides=('revc')
license=('none')

install=$pkgname.install
source=('git://github.com/GTAmodding/re3.git' 'launch.sh' 'GTAVC.desktop')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/re3"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/re3"

    git submodule update --init --recursive
    git checkout miami
}

build() {
    cd "$srcdir/re3"

    ./premake5Linux --with-librw gmake2
    cd "build"
    "./../printHash.sh" "./../src/extras/GitSHA1.cpp"
    make O=. config=release_linux-amd64-librw_gl3_glfw-oal
}

package() {
    cd "$srcdir/re3/bin/linux-amd64-librw_gl3_glfw-oal/Release"
    install -d $pkgdir/opt/reVC
    install -m755 reVC $pkgdir/opt/reVC/
    install -m755 $srcdir/launch.sh $pkgdir/opt/reVC/
    install -D -m644 $srcdir/GTAVC.desktop $pkgdir/usr/share/applications/GTAVC.desktop
}
