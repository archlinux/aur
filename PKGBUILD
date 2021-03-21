# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>

pkgname=pilot-git
_pkgname=Pilot
pkgver=r173.2b34874
pkgrel=1
pkgdesc="Orca's best friend."
arch=('x86_64')
url='http://wiki.xxiivv.com/Pilot'
license=('MIT')
depends=('electron')
makedepends=('npm' 'git')
source=("$pkgname::git+https://github.com/hundredrabbits/Pilot.git")
sha1sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


build() {
    cd "${srcdir}/${pkgname}/desktop"
    npm install

    npx electron-packager . "${_pkgname}" --platform=linux  --arch=x64 --out build/ --overwrite --icon=icon.ico 
}


package() {
    install -dm755 "${pkgdir}/opt"
    mv "${srcdir}/${pkgname}/desktop/build/"${_pkgname}"-linux-x64" "${pkgdir}/opt/"${_pkgname}""

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/"${_pkgname}"/"${_pkgname}" "${pkgdir}/usr/bin/pilot"

    # generate freedesktop entry files, aligned with description in package.json and forge.config.js
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<END
[Desktop Entry]
Name=${_pkgname}
Comment=Orca's best friend
Exec=pilot %U
Terminal=false
Type=Application
Icon=${_pkgname}
StartupWMClass=${_pkgname}
END
}
