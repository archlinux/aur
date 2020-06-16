# Maintainer: Peter PJT (pjtsearch) <peterpjtsearch at gmail dot com>

pkgname=graviton-git
pkgver=2.0.89
pkgrel=1
pkgdesc="A modern code editor"
arch=('x86_64')
url="https://graviton.netlify.app/"
license=('MIT')
depends=('nss' 'gtk3' 'libxss')
makedepends=('git' 'npm' 'nodejs')
options=('!strip')
provides=("graviton")
_pkgname=Graviton-App
_installname=graviton
source=("git+https://github.com/Graviton-Code-Editor/Graviton-App"
        "${_installname}.desktop")

md5sums=('SKIP'
         '983056e81b5569e09a9f60a43c7df2e5')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  node -p -e "require('./package.json').version"
}

build(){
    cd "${srcdir}/${_pkgname}"
    npm install
    npm run build:AppImage
}

package() {
    cd "${srcdir}/${_pkgname}/dist/linux-unpacked"

    install -dm755 "$pkgdir/opt/Graviton"
    install -dm755 "$pkgdir/usr/bin"
    cp -r * "$pkgdir/opt/Graviton"
    ln -s "/opt/Graviton/${_installname}" "$pkgdir/usr/bin/${_installname}"

    # Install Other things
    install -Dm644 "$srcdir/${_pkgname}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/${_installname}.desktop" "$pkgdir/usr/share/applications/${_installname}.desktop"

    # Install icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512; do
        install -Dm644 "$srcdir/${_pkgname}/assets/building/linux/$i.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/${_installname}.png"
    done
}
