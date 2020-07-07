# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton
_pkgname=Graviton-App
pkgver=2.0.92
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
makedepends=('npm')
provides=("graviton")
conflicts=("graviton-bin")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/archive/${pkgver}.tar.gz"
        'graviton.desktop'
        'build.patch')

sha256sums=('cf012cdc855efb4fbd320c8c92973dfe4cb92f4f019be90aaf5c7cc3fb2cb380'
            '274abb2bef19694a483dc0f9d1bad14ad397b68e9e07f13580eac4cecc5163dd'
            'a5b842ae3cc53f6f247ffc27d9b787883dc0e11866e77a38bc1c2f6d7ba00d1f')

prepare() {
    cd $srcdir/${_pkgname}-$pkgver
    patch -Np1 -i "$srcdir/build.patch"
}

build() {
    cd $srcdir/${_pkgname}-$pkgver
    npm install
    npm run build
}

package() {
    # Install 
    cd "$srcdir/${_pkgname}-$pkgver/dist/linux-unpacked"
    install -dm755 "$pkgdir/opt/Graviton"
    install -dm755 "$pkgdir/usr/bin"
    cp -r * "$pkgdir/opt/Graviton"
    ln -s /opt/Graviton/graviton "$pkgdir/usr/bin/graviton"

    # Install Other things
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icons
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/logo.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
}
