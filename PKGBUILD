# Maintainer:  Justin Kinnaird <jkinnaird1991@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>

pkgname=emulationstation-fcamod-git
pkgdesc="A graphical front-end for emulators with controller navigation, with fcamod"
pkgrel=2
pkgver=r1685.bbcd68d6
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/fabricecaruso/EmulationStation"
license=('MIT')
depends=('sdl2_mixer' 'freeimage' 'vlc' 'curl')
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm' 'rapidjson' 'glu')
conflicts=('emulationstation' 'emulationstation-git')
provides=('emulationstation')
source=("$pkgname::git+https://github.com/fabricecaruso/EmulationStation.git"
        'share-dir.patch'
        'emulationstation.desktop')
sha512sums=('SKIP'
            '72dcac3938c62ecda365bb50088658828d3876aa01d6a9ad21cb1b05da41f7defdee856ff353ab7b37d17a7f0b1e56d862e0da2da2b109e0dde3f8656a7848be'
            '00ddb6f2175290bf2cdb1fdee371c13fe67776b5222c9d79d3c1db1755d08d4cdae4f344d8131f97ef534d7e76dd2dc768f0ff49a41d0a8ee88fe44d4040e485')
if [ "$CARCH" = "armv6h" ]; then
depends+=('raspberrypi-firmware')
fi

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch --forward --strip=1 --input="${srcdir}/share-dir.patch"
    git submodule update --init
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p 'build'
    cd 'build'
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DOpenGL_GL_PREFERENCE=GLVND \
          ..
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname/emulationstation" "$pkgdir/usr/bin/emulationstation"
    install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname/resources/window_icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/emulationstation.png"
    install -Dm644 "$srcdir/emulationstation.desktop" "$pkgdir/usr/share/applications/emulationstation.desktop"
    install -dm755 "$pkgdir/usr/share/emulationstation"
    cp -r "$srcdir/$pkgname/resources" "$pkgdir/usr/share/emulationstation"
}
