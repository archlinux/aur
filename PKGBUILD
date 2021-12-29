# Maintainer: Misha <mishakmak at gmail dot com>
pkgname=orca-desktop-git
pkgver=r1370.61a3731
pkgrel=1
pkgdesc='Electron GUI for the Orca live-coding environment'
arch=('x86_64')
url='https://github.com/hundredrabbits/Orca'
license=('MIT')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('pilot-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgname%-git}/desktop"
    
    HOME="$srcdir/.electron-gyp" npm install
    HOME="$srcdir/.electron-gyp" npx electron-packager . "${_pkgname}" --platform=linux  --arch=x64 --out build/ --overwrite --icon=icon.ico 
}

package() {
    cd "$srcdir/${pkgname%-git}/desktop"
    
    install -dm755 "${pkgdir}/opt/${pkgname%-git}"
    mv build/Orca-linux-x64/* "${pkgdir}/opt/${pkgname%-git}" 

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-git}/Orca" "${pkgdir}/usr/bin/${pkgname%-git}"
    
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
    install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
   
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname%-git}.desktop" <<END
[Desktop Entry]
Name=Orca Desktop
Comment=Electron Live-coding GUI for Orca
Exec=${pkgname%-git} %U
Terminal=false
Type=Application
Icon=${pkgname%-git}
StartupWMClass=${pkgname%-git}
END
}
