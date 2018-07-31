# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Reotip Sakuraga <reotipfur@gmail.com>

pkgname=doomseeker
pkgver=r2191+.c2c7f37b1afb+
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

source=("hg+https://bitbucket.org/Doomseeker/doomseeker#revision=c2c7f37"
        "doomseeker.desktop"
        "doomseeker-launch-script.sh"
        "doomseeker.qt5.11.patch")

sha256sums=('SKIP'
            '64004248a2dd3771292e63717a05e1859f1ffe6d6fd5f16ebfa1427b9a43533f'
            '96fca72228a50d80b019adf3c82b8800a9d7f03994252e544513537541d011a4'
            'de43c3fe7557079f1937e6c5aef5c01fa3ce4c4bd561db73a0b2a1fe2193bcdb')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "${srcdir}/doomseeker.qt5.11.patch" 
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make
}

package() {
    mkdir -p "$pkgdir/usr/games/doomseeker/engines/"
    cd "$srcdir/$pkgname/build"
    install -Dm755 doomseeker "$pkgdir/usr/games/doomseeker"
    install -Dm755 -t "$pkgdir/usr/games/doomseeker/" libwadseeker.so*
    cd engines
    install -Dm755 -t "$pkgdir/usr/games/doomseeker/engines/" *.so
    cd ../../
    install -Dm644 "media/icon.png" "$pkgdir/usr/share/pixmaps/doomseeker.png"
    install -Dm755 "$srcdir/../doomseeker-launch-script.sh" "$pkgdir/usr/bin/doomseeker"
    install -Dm644 "$srcdir/../doomseeker.desktop" "$pkgdir/usr/share/applications/doomseeker.desktop"
}
