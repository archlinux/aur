# Maintainer: Toby Jones <quoth.the.server@gmail.com>
# Maintainer: hexptr <hexptr@protonmail.com>

pkgname=etterna-git
pkgver=0.70.2.r43.g1e87052268
pkgrel=2
pkgdesc="Etterna: an advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
provides=('etterna')
depends=(glu libgl libogg libx11 libxrandr openssl)
makedepends=(cmake git)
optdepends=('alsa-lib: audio output via ALSA'
            'libpulse: audio output via PulseAudio'
            'jack: audio output via JACK')
source=('git+https://github.com/etternagame/etterna#branch=develop'
        etterna.desktop)
sha512sums=('SKIP'
            '0a82ae9ac0c9b38db69d742981e1356b960dae3943f19ec03268e1d38d22bfc313b9f8a53f28c7449c4f42b9ec675fb9bd703efe58020748de98386a6010880a')
install=etterna-git.install

pkgver() {
    cd "$srcdir/etterna"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/etterna"
    sed -i CMakeLists.txt -e 's/\(set(OPENSSL_USE_STATIC_LIBS\) ON/\1 OFF/'
}

build() {
    cd "$srcdir/etterna"

    mkdir -p "build"
    cd "build"
    cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release ..

    make
}

package() {
    cd "$srcdir/etterna/build"

    install -Dm755 "$srcdir/etterna/Etterna" "$pkgdir/opt/etterna-git/etterna"

    cp -R "$srcdir/etterna/Announcers/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Assets/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/BackgroundEffects/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/BackgroundTransitions/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/BGAnimations/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Data/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/NoteSkins/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Scripts/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Songs/" "$pkgdir/opt/etterna-git"
    cp -R "$srcdir/etterna/Themes/" "$pkgdir/opt/etterna-git"

    mkdir "$pkgdir/opt/etterna-git/Cache"

    cp "$srcdir/etterna/src/archutils/Win32/Etterna.ico" "$pkgdir/opt/etterna-git/icon.ico"

    chmod 777 -R "$pkgdir/opt/etterna-git"
    chown -R nobody:nobody "$pkgdir/opt/etterna-git"

    install -Dm644 "$srcdir/etterna.desktop" "$pkgdir/usr/share/applications/etterna.desktop"
}
