# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton
_pkgname=Graviton-App
pkgver=2.3.0
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
makedepends=('yarn' 'nodejs' 'node-gyp')
provides=("graviton")
conflicts=("graviton-bin")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/archive/v${pkgver}.tar.gz"
        'graviton.desktop'
        'build.patch')

sha256sums=('d87901c863dbe75ab662dbc3b6de7ca106a7e6b44d23385462d929d631442d6a'
            '274abb2bef19694a483dc0f9d1bad14ad397b68e9e07f13580eac4cecc5163dd'
            '021eac4c4cb19d3e425d716c15d4577b3ed9cdcb5b0a35fcb9115ac3efd823fc')

prepare() {
    cd $srcdir/${_pkgname}-$pkgver
    patch -Np1 -i "$srcdir/build.patch"
}

build() {
    cd $srcdir/${_pkgname}-$pkgver
    yarn
    yarn build
}

package() {
    # Install 
    cd "$srcdir/${_pkgname}-$pkgver/dist/linux-unpacked"
    install -dm755 "$pkgdir/opt/Graviton Editor"
    install -dm755 "$pkgdir/usr/bin"
    cp -r * "$pkgdir/opt/Graviton Editor"
    ln -s "/opt/Graviton Editor/graviton" "$pkgdir/usr/bin/graviton"

    # Install Other things
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icons
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/logo.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
}
