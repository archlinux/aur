# Maintainer: Toby Jones <quoth.the.server@gmail.com>
# Maintainer: hexptr <hexptr@protonmail.com>

pkgname=etterna-git
pkgver=0.70.1
pkgrel=1
pkgdesc="Etterna: an advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
provides=('etterna')
conflicts=('etterna')
depends=(libmad gtk2 glu glew curl libpulse cmake)
optdepends=('jack: Audio server')
source=('git+https://github.com/etternagame/etterna'
        mufft.patch
        etterna.desktop)
sha512sums=('SKIP'
            'e42ba43a7d41c028b5620814cdfde6110835a34ccd0a6b3193f080cf9226c0012d52e4a21b8900b1be3838deb7bc58c4eb7a08d16a5fa3c0bac56fa2e1e5088b'
            '0a82ae9ac0c9b38db69d742981e1356b960dae3943f19ec03268e1d38d22bfc313b9f8a53f28c7449c4f42b9ec675fb9bd703efe58020748de98386a6010880a')
install=etterna-git.install

pkgver() {
    curl --silent https://api.github.com/repos/etternagame/etterna/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/^v\(.*\)/\1/'
}

build() {
    cd "$srcdir/etterna"

    git checkout v$(pkgver)
    git submodule update --init

    sed -i CMakeLists.txt -e 's/\(set(OPENSSL_USE_STATIC_LIBS\) ON/\1 OFF/'
    patch -p1 < "$srcdir/mufft.patch"

    mkdir "build"
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
