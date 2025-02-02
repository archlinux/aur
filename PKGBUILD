# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-git
pkgver=2.47.0.r0.g6495a31
pkgrel=1
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux (GitHub Version)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${pkgname%-git}")
_electron=electron33
depends=('bash' "${_electron}")
makedepends=('asar' 'gendesk' 'git' 'npm')
optdepends=('libappindicator-gtk3: systray and app indicator support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    sed -i 's|../../assets|assets|' src/main/main.ts
    sed -i "s#path.join(process.resourcesPath, 'assets')#path.join(app.getAppPath().replace('/app.asar', ''), 'assets')#" \
        src/main/main.ts
    sed -i 's/"devEngines"/"engines"/' package.json
    gendesk -f -n \
        --pkgname "${pkgname%-git}" \
        --pkgdesc "${pkgdesc}" \
        --name 'Oblivion Desktop' \
        --categories 'Utility' \
        --custom StartupWMClass='Oblivion Desktop'

    npm install
}

build() {
    cd "${pkgname%-git}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname%-git}"
    install -d "${pkgdir}/usr/lib"
    install -Dm644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/${pkgname%-git}"
    cat >> "${pkgdir}/usr/bin/${pkgname%-git}" << EOD
#! /usr/bin/sh
exec $_electron /usr/lib/oblivion-desktop "\$@"
EOD
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
    asar e "release/build/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname%-git}/"
    cp -r assets "${pkgdir}/usr/lib/${pkgname%-git}/"
}
# vim:set ts=4 sw=4 et:
