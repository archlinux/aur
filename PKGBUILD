# Maintainer: Andrew-LD <andrewld@protonmail.com>

_pkgname=lutris-gamepad-ui
pkgname=$_pkgname-git
pkgver=v0.2.0.r4.gfe81f43
pkgrel=1
pkgdesc="A simple, TV-friendly, gamepad-navigable frontend for Lutris"
arch=('x86_64')
url="https://github.com/andrew-ld/lutris-gamepad-ui"
license=('GPL3')
depends=('electron43' 'lutris' 'pulse-native-provider' 'bluez' 'xdg-desktop-portal' 'ddcutil')
makedepends=('npm' 'git')
source=("git+https://github.com/andrew-ld/lutris-gamepad-ui" "lutris-gamepad-ui.sh" "lutris-gamepad-ui.desktop")
sha256sums=('SKIP' '20c542329910a4e26c5169855ba05a611fbae9822acfa1a514709a0e77e4597e' '7f21e37b1eb918ebd191b23de176e568e7b73e7ac82ddf89668e35908588238e')

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

    find "$_pkgname/node_modules/koffi/build/koffi/" -type f \( -name "koffi.node" -o -name "koffi.exp" -o -name "koffi.lib" \) ! -path "*linux_x64*" -delete

    cp -rp "$_pkgname/dist" "$pkgdir/usr/lib/$_pkgname/dist"
    cp -rp "$_pkgname/node_modules" "$pkgdir/usr/lib/$_pkgname/node_modules"

    find "$pkgdir/usr/lib/$_pkgname/" -type d -empty -delete
}
