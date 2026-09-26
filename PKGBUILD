# Maintainer: Vo1dTear <vo1dtear.01@gmail.com>

pkgname=fooyin-plugin-midi-git
pkgver=r4.b2b47ea
pkgrel=1
pkgdesc='A MIDI input plugin for fooyin'
arch=('x86_64')
url='https://github.com/Vo1dTear/fooyin-plugin-midi'
license=('GPL-3.0-or-later')

depends=('fooyin' 'libspessasynth-git' 'rtmidi')
makedepends=('git' 'cmake' 'pkgconf')

source=(
    "$pkgname::git+$url.git"
    "Nuked-SC55::git+https://github.com/jcmoyer/Nuked-SC55.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf 'r%s.%s\n' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    git submodule init
    git config submodule.external/Nuked-SC55.url "$srcdir/Nuked-SC55"
    git -c protocol.file.allow=always submodule update \
        3rdparty/Nuked-SC55
}

build() {
    cmake -B "$srcdir/build" \
        -S "$srcdir/$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMIDI_ENABLE_NUKED_SC55=ON \
        -DMIDI_ENABLE_EXTERNAL=ON \
        -DMIDI_BUILD_TESTS=OFF

    cmake --build "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
