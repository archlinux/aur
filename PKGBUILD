# Maintainer: parhammed <parhammed@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

_pkgname=oblivion-desktop
pkgname="${_pkgname}-git"
pkgver=3.11.0.r6.g9fdf217
pkgrel=2
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux (GitHub Version)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${_pkgname}")
_electron=electron38
depends=('bash' "${_electron}")
makedepends=('gendesk' 'nvm' 'npm')
optdepends=('libappindicator-gtk3: systray and app indicator support')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-bin"
)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    source /usr/share/nvm/init-nvm.sh

    cd "${_pkgname}"
    
    sed "s/process.resourcesPath/path.dirname(app.getAppPath())/" -i src/main/main.ts
    
    gendesk -f -n \
        --pkgname "${_pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Oblivion Desktop' \
        --categories 'Utility' \
        --custom StartupWMClass='Oblivion Desktop'
    
    nvm install 22
    npm install
}

build() {
    cd "${_pkgname}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${_pkgname}"
    install -d "${pkgdir}/usr/lib"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/${_pkgname}"
    cat >> "${pkgdir}/usr/bin/${_pkgname}" << EOD
#! /usr/bin/sh
exec $_electron /usr/lib/oblivion-desktop/app.asar "\$@"
EOD
    install -Dm644 release/build/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -r release/build/linux-unpacked/resources/assets "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
# vim:set ts=4 sw=4 et:
