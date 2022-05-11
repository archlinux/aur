pkgname=revc-git
pkgver=1
pkgrel=1
pkgdesc="Grand Theft Auto Vice City reverse engineered"
arch=('x86_64')
depends=('openal' 'glew' 'glfw' 'libsndfile' 'mpg123')
makedepends=('git' 'cmake' 'premake')
provides=('revc')
license=('none')

install=$pkgname.install
source=(
    'git+https://github.com/erorcun/re3.git#branch=miami'
    'git+https://github.com/aap/librw.git'
    'git+https://github.com/xiph/ogg.git'
    'git+https://github.com/xiph/opus.git'
    'git+https://github.com/xiph/opusfile.git'
    'launch.sh'
    'GTAVC.desktop')
md5sums=(
    'SKIP'
    'SKIP' 
    'SKIP' 
    'SKIP' 
    'SKIP' 
    '9eb2aff2687f8cc735ea93e0460f07e0' 
    '2991b7cf6751274bfdccc7b6f0272129')

pkgver() {
  cd "$srcdir/re3"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/re3"

    git submodule init
    for submod in librw ogg opus opusfile
    do
      git config "submodule.vendor/$submod.url" "../$submod"
    done
    git submodule update
}

build() {
    cd "$srcdir/re3"

    premake5 --with-librw gmake2
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
