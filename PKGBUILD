# Maintainer: Ariel AxionL <axionl@aosc.io>
# Co-Maintener: Samuel Van Zuijlen <sam.vzh@orange.fr>

pkgname=sielo-browser-git
_pkgname=sielo-browser
pkgver=r1255.390246a
pkgrel=2
pkgdesc="A simple, customizable and fast web browser"
arch=('x86_64')
depends=('qt5-webengine')
makedepends=('git' 'cmake' 'imagemagick'
             'qt5-webchannel' 'qt5-location' 'qt5-declarative')
conflicts=("sielo-browser")
provides=("sielo-browser")
url="https://github.com/SieloBrowser/SieloBrowser"
license=('MIT')

source=("$pkgname::git+${url}"
        "https://raw.githubusercontent.com/SieloBrowser/SieloBrowser/master/LICENSE"
        "${_pkgname}.desktop")

sha256sums=('SKIP'
            '4188f2493b00dc3c8f3ec23485a1af12d6b50cc4e3273bc47cee9c1580f5e4c3'
            'cd42f495ac22e2cf46441d59839bcb0a744b7b368392cbbdc85763e305759af7')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgname}
    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j $(grep -c processor /proc/cpuinfo)

    cd ..
    for i in 16 24 32 48 64 96 128 256; do
        mkdir -p icon/${i}x${i}/apps
        convert icons/other/ic_sielo.png -resize ${i}x${i} icon/${i}x${i}/apps/${_pkgname}.png
    done
}

package() {
    # License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install Icons and desktop file
    install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    cd $srcdir/$pkgname
    install -dm755 ${pkgdir}/usr/share/icons/hicolor
    cp -r icon/* ${pkgdir}/usr/share/icons/hicolor/

    # Binaries
    install -Dm755 build/bin/sielo-browser ${pkgdir}/usr/bin/sielo-browser
    install -Dm755 build/bin/sielo-compiler ${pkgdir}/usr/bin/sielo-compiler
    install -Dm755 build/bin/libSieloCore.so ${pkgdir}/usr/lib/libSieloCore.so
}
# vim set: ts=4 sw=4 et
