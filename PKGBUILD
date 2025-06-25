# Maintainer: Andrew-LD <andrewld@protonmail.com>

_pkgname=lutris-gamepad-ui
pkgname=$_pkgname-git
pkgver=0.1.3.r24.g2f3e28c
pkgrel=1
pkgdesc="A simple, TV-friendly, gamepad-navigable frontend for Lutris"
arch=('x86_64')
url="https://github.com/andrew-ld/lutris-gamepad-ui"
license=('GPL3')
depends=('electron36' 'lutris')
makedepends=('npm' 'git')
source=("git+https://github.com/andrew-ld/lutris-gamepad-ui" "lutris-gamepad-ui.sh" "lutris-gamepad-ui.desktop")
sha256sums=('SKIP' '1e374eb7dc521f1944d7523d96c634c24bac0968478b18baad8173ee5d5d5c83' 'fbb78ffe31da8ed401574e11b10ded372967fb70bec835a06de16ab7f99b9a3f')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    npm install --cache "${srcdir}/npm-cache"
    npm run build:vite
    npm prune --omit=dev
}

package() {
    install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$_pkgname.desktop"
    install -vDm755 "lutris-gamepad-ui.sh" "$pkgdir/usr/bin/$_pkgname"

    install -vDm644 "$_pkgname/src/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -vDm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -vDm644 "$_pkgname/electron.js" "$pkgdir/usr/lib/$_pkgname/electron.js"

    cp -rp "$_pkgname/dist" "$pkgdir/usr/lib/$_pkgname/dist"
    cp -rp "$_pkgname/node_modules" "$pkgdir/usr/lib/$_pkgname/node_modules"
}
