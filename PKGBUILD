# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: Jeanbon
# Contributor: tritonas00
# Contributor: sp33dyx

_pkgname=rigsofrods _gitname=rigs-of-rods

pkgname=$_pkgname-git
pkgver=2022.12.r117.gb0fc91954
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="http://rigsofrods.org" 
license=('GPL')
depends=('curl' 'openssl' 'fmt' 'mygui-ogre' 'ogre' 'ois' 'openal' 'rapidjson>=1.1.0' 'angelscript' 'caelum' 'nvidia-cg-toolkit' 'ogre-pagedgeometry')
makedepends=('gcc' 'cmake>=2.8' 'git')
conflicts=('rigsofrods' 'rigsofrods-hg' 'rigsofrods-noangelscript-git')
provides=('rigsofrods')
source=("git+https://github.com/RigsOfRods/$_gitname.git#branch=aur" "rigsofrods.png" "RoR.desktop")
sha512sums=('SKIP'
            '1aaf75c5a22d2129e1fe6293689a347cec07c6d3d3b9990810bc6033b7ca9fd2d9f0c169eb27224ddac23a95982824eb36a9f21aa2f5e90dca82d4c8513023fd'
            'f4396b67d65f50e1850b36bb1913ee411570a667ce4bf0b83bb96af34c53f7655936c68b9ce001e21fa9b4140e8f78f28620ff133e44f0049c1d601f3c973f71')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"

    # get a clean build dir
    [[ -d build ]] && rm -rf build 
    mkdir build && cd build

    # cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_NATIVE=TRUE \
        -DCUSTOM_VERSION=$pkgver
    make
}

package() {
    cd "$srcdir/$_gitname/build"

    make DESTDIR="$pkgdir" install

    cd "$srcdir"
    install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
    install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
}
