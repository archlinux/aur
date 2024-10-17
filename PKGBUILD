# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: Jeanbon
# Contributor: tritonas00
# Contributor: sp33dyx

_pkgname=rigsofrods 
_gitname=rigs-of-rods

pkgname=$_pkgname-git
pkgver=2022.12.r441.gbb73c5201
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="http://rigsofrods.org" 
license=('GPL')
makedepends=('gcc' 'cmake>=2.8' 'git' 'conan')
conflicts=('rigsofrods' 'rigsofrods-hg' 'rigsofrods-noangelscript-git')
provides=('rigsofrods')
source=("git+https://github.com/RigsOfRods/$_gitname.git" "rigsofrods.png" "RoR.desktop")
sha512sums=('SKIP'
            '1aaf75c5a22d2129e1fe6293689a347cec07c6d3d3b9990810bc6033b7ca9fd2d9f0c169eb27224ddac23a95982824eb36a9f21aa2f5e90dca82d4c8513023fd'
            '8d4d8e997e0df2688eafa19655540e6ec87675ec96ba6ebd34a7dc84246374fbdb45747563c39f1b2e9bce800d6978d5b3822a0d6ea278eb72bee09a88c3913a')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"

    # This is required to get the ancient dependencies to build
    export CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"

    export CONAN_HOME="$srcdir/conanroot/"

    # Setup conan
    conan profile detect --force
    conan remote add ror-conan https://git.anotherfoxguy.com/api/packages/rorbot/conan -f
    
    # get a clean build dir
    [[ -d build ]] && rm -rf build

    conan install . -s build_type=Release -b missing -pr:b=default -c tools.cmake.cmaketoolchain:generator="Ninja" -of build
    # Cleanup conan
    conan cache clean "*" -sbd

    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/} 

    cmake --preset conan-release -DCMAKE_INSTALL_PREFIX="/opt/$_pkgname" -DCREATE_CONTENT_FOLDER=ON

    cd build
    ninja
}

package() {
    cd "$srcdir/$_gitname/build"

    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/} 

    DESTDIR="$pkgdir" ninja install

    cd "$srcdir"
    install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
    install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
}
