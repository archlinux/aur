# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=doomseeker
pkgver=1.3.2.r0.g76de31dc
pkgrel=1
epoch=1
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="https://doomseeker.drdteam.org/"
license=("LGPL")

depends=('zlib' 'bzip2' 'qt5-tools' 'qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'git')
optdepends=('qt4: A cross-platform application and UI framework'
            'zandronum: GZDoom fork supporting client/server multiplayer'
            'odamex: Classic client/server multiplayer fork'
            'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom'
            'srb2: A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")')

source=('doomseeker::git+https://bitbucket.org/Doomseeker/doomseeker#tag=1.3.2'
        'doomseeker-blobs::git+https://bitbucket.org/Doomseeker/doomseeker-blobs#commit=919add0')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname-blobs"
    python3 geolite2_conv.py geo/GeoLite2-Country-Blocks-IPv4.csv geo/GeoLite2-Country-Locations-en.csv "$srcdir/$pkgname/src/core/IpToCountry.dat"
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake   -DCMAKE_BUILD_TYPE=Release                              \
            -DCMAKE_INSTALL_PREFIX=/usr                             \
            -DDOOMSEEKER_IP2C_DAT:FILEPATH="IpToCountry.dat"        \
            ..
    make
}

package() {
    cd "$srcdir/$pkgname/build/"
    make DESTDIR=$pkgdir install
}
