# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Reotip Sakuraga <reotipfur@gmail.com>

pkgname=doomseeker
pkgver=r2205.aafacb71daee
pkgrel=1
epoch=1
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="https://doomseeker.drdteam.org/"
license=("LGPL")

depends=('zlib' 'bzip2' 'qt5-tools' 'qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'mercurial')
optdepends=('qt4: A cross-platform application and UI framework'
            'zandronum: GZDoom fork supporting client/server multiplayer'
            'odamex: Classic client/server multiplayer fork'
            'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom'
            'srb2: A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")')

source=("hg+https://bitbucket.org/Doomseeker/doomseeker#revision=aafacb7")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

# No longer needed. Patch was commited.
#prepare() {
#    cd "$srcdir/$pkgname"
#    patch -p1 -i "${srcdir}/doomseeker.qt5.11.patch"
#}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname/build/"
    make DESTDIR=$pkgdir install
    # lib64 is a symlink. We have to move stuff to lib
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
