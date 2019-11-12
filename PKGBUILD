# Maintainer:  Justin Kinnaird <jkinnaird1991@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>

pkgname=emulationstation-fcamod-git
pkgdesc="A graphical front-end for emulators with controller navigation, with fcamod"
pkgrel=1
pkgver=r1685.bbcd68d6
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/fabricecaruso/EmulationStation"
license=('MIT')
depends=('alsa-lib' 'sdl2' 'sdl2_mixer' 'boost-libs' 'freeimage' 'ttf-dejavu' 'glu' 'vlc' 'libcec')
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm' 'rapidjson')
conflicts=('emulationstation' 'emulationstation-git')
provides=('emulationstation')
source=("$pkgname::git+https://github.com/fabricecaruso/EmulationStation.git"
        'share-dir.patch')
sha512sums=('SKIP'
            '72dcac3938c62ecda365bb50088658828d3876aa01d6a9ad21cb1b05da41f7defdee856ff353ab7b37d17a7f0b1e56d862e0da2da2b109e0dde3f8656a7848be')
if [ "$CARCH" = "armv6h" ]; then
depends+=('raspberrypi-firmware')
else
depends+=('libgl')
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
    install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation/LICENSE"
    install -dm 755 "$pkgdir/usr/share/emulationstation"
    cp -r "$srcdir/$pkgname/resources" "$pkgdir/usr/share/emulationstation"
}
