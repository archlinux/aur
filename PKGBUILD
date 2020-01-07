# Maintainer: Simon Tas <simon.tas.st@gmail.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>
pkgname="deezloader-remix-git"
_pkgname="DeezloaderRemix"
pkgver=4.2.1.r258.gbfb9838
pkgrel=3
pkgdesc="An improved version of Deezloader based on the Reborn branch.
        Download songs, playlists and albums directly from Deezer's servers."
arch=('x86_64')
url="https://notabug.org/RemixDevs/${_pkgname}"
license=('GPL3')
makedepends=('git' 'npm')
depends=('electron3' 'libappindicator-gtk3' 'libnotify')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("${pkgname%-git}::git+https://notabug.org/RemixDevs/DeezloaderRemix.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
md5sums=('SKIP'
         '7355cbb7fcc93a0768f3b652664f67b6'
         '3505cf1381c8a4e7e96200d1b7ab6fb0')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    
    # use system electron version
    # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
    electronDist=$(dirname $(realpath $(which electron3)))
    electronVer=$(electron3 --version | tail -c +2)
    sed -i '/		"electron": /d' ./package.json
    HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    ./node_modules/.bin/electron-builder --linux --x64 --dir dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname%-git}/"
    
    install -Dm644 app/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
 
 
