# Maintainer: Andrew-LD <andrewld@protonmail.com>

_pkgname=lutris-gamepad-ui
pkgname=$_pkgname-git
pkgver=v0.1.22.r0.g2c02ae0
pkgrel=1
pkgdesc="A simple, TV-friendly, gamepad-navigable frontend for Lutris"
arch=('x86_64')
url="https://github.com/andrew-ld/lutris-gamepad-ui"
license=('GPL3')
depends=('electron37' 'lutris' 'pulse-native-provider' 'bluez' 'xdg-desktop-portal')
makedepends=('npm' 'git')
source=("git+https://github.com/andrew-ld/lutris-gamepad-ui" "lutris-gamepad-ui.sh" "lutris-gamepad-ui.desktop")
sha256sums=('SKIP' '61cf30e80ec121eb5264348eae77cccff4a534a7c35fe88a1782879b1e3643a7' '722634bb273ba3dbb3b157631139e1018fee4cd2675afae5a66858f9099fb996')

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

    install -vDm644 "$_pkgname/src_frontend/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -vDm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    for file in "$_pkgname"/electron*.cjs; do
        filename=$(basename $file)
        install -vDm644 "$file" "$pkgdir/usr/lib/$_pkgname/$filename"
    done

    cp -rp "$_pkgname/src_backend" "$pkgdir/usr/lib/$_pkgname/src_backend"

    install -vDm644 "$_pkgname/lutris_wrapper.py" "$pkgdir/usr/lib/$_pkgname/lutris_wrapper.py"
    install -vDm644 "$_pkgname/lutris_wrapper.sh" "$pkgdir/usr/lib/$_pkgname/lutris_wrapper.sh"
    install -vDm644 "$_pkgname/package.json" "$pkgdir/usr/lib/$_pkgname/package.json"

    cp -rp "$_pkgname/dist" "$pkgdir/usr/lib/$_pkgname/dist"
    cp -rp "$_pkgname/node_modules" "$pkgdir/usr/lib/$_pkgname/node_modules"

    find "$pkgdir/usr/lib/$_pkgname/" -type d -empty -delete
}
