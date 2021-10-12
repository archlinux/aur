# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=0.0.4.r74.ga03892d
pkgrel=1
pkgdesc='A simple music player'
arch=('x86_64')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname%-git}")
depends=('electron')
makedepends=('git' 'nodejs' 'yarn')
source=("$pkgname-git::git+$url#branch=main" moosync moosync.desktop)
sha256sums=('SKIP' '76fa98490ebc9c5b2e29a11b4a2abf72080a44903ae3dd53a8c0ff65ff5eee6b' 'e21b3972035947af7515bad24965a3786756cbfbf12e9c2df6d6029151a47da3')

pkgver() {
  cd "${pkgname}-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}-git"
    yarn install && yarn electron:build --dir
}

package() {
    cd "${pkgname}-git"


    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r dist_electron/linux-unpacked/resources/* "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "build/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "build/icons/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"

    cd ../
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
}
