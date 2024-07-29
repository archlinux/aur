# Maintainer: Ash <xash at riseup d0t net>
pkgname=respawnirc
pkgver=3.1.16
pkgrel=3
pkgdesc="Logiciel offrant une interface de client IRC pour les forums de jeuxvideo.com"
arch=('x86_64')
url="https://pijon.fr/RespawnIRC/"
license=('Zlib')
depends=('qt5-base' 'qt5-multimedia' 'qt5-webengine' 'hunspell')
makedepends=('qt5-tools')
source=(
    "https://github.com/FranckRJ/RespawnIRC/archive/refs/tags/v${pkgver}.tar.gz"
    "respawnirc.desktop"
)
sha256sums=('SKIP'
            '220ebdf594fd3f69a971f331d848ce07a5624636221e0c0f768f0ad1ff56b7c2')

prepare() {
    cd "$srcdir/RespawnIRC-${pkgver}/respawnIrc"

    # Patch the respawnIrc.pro file to use system hunspell
    sed -i 's|LIBS += -L$$PWD/../hunspell/lib/ -llibhunspell|LIBS += -lhunspell|' respawnIrc.pro
    sed -i 's|INCLUDEPATH += $$PWD/../hunspell/include||' respawnIrc.pro
    sed -i 's|DEPENDPATH += $$PWD/../hunspell/include||' respawnIrc.pro
}

build() {
    cd "$srcdir/RespawnIRC-${pkgver}/respawnIrc"
    
    qmake
    make
}

package() {
    cd "$srcdir/RespawnIRC-${pkgver}/respawnIrc"
    
    # Install the executable
    install -Dm755 "RespawnIRC" "$pkgdir/usr/bin/RespawnIRC"
    
    # Install the documentation and license files
    install -Dm644 "$srcdir/RespawnIRC-${pkgver}/README.md" "$pkgdir/usr/share/doc/respawnirc/README.md"
    install -Dm644 "$srcdir/RespawnIRC-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/respawnirc/LICENSE"
    
    # Install the .desktop file
    install -Dm644 "$srcdir/respawnirc.desktop" "$pkgdir/usr/share/applications/respawnirc.desktop"
    
    # Install the icon
    install -Dm644 "$srcdir/RespawnIRC-${pkgver}/respawnIrc/rirc.ico" "$pkgdir/usr/share/icons/hicolor/48x48/apps/respawnirc.ico"
}
