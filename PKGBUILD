#Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=go-to-meeting-desktop
pkgver=1.0.0
pkgrel=2
pkgdesc="Go To Meeting desktop built with electron"
arch=("any")
url="https://github.com/CrankySupertoon/gotomeeting-linux-desktop"
license=("MIT")
depends=("electron")
makedepends=("gendesk" "yarn" "npm")
source=("https://raw.githubusercontent.com/CrankySupertoon/gotomeeting-nativefier/master/icon.png"
	       "https://github.com/CrankySupertoon/gotomeeting-linux-desktop/archive/${pkgver}.tar.gz")
md5sums=('287a6b0529c8eab2bb848a39da810a94'
                '55a9186d4666bae9ef485825c5b814b6')

prepare() {
    # Generate .desktop
    gendesk --pkgname "GoToMeeting" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f

    cd "${srcdir}/gotomeeting-linux-desktop-${pkgver}"

    # Upstream targets Electron 8, which can no longer run the current GoTo web
    # app (SyntaxError in its bundle), so run with the system electron instead.
    # Since Electron 20 preload scripts are sandboxed by default and cannot
    # require() local modules, and since Electron 12 contextIsolation is on by
    # default, but polyfill.js needs to inject into the page.
    sed -i 's/webPreferences: {/webPreferences: {\n      sandbox: false,/' src/main/window.js
    sed -i '/new BrowserView({/{n;s/webPreferences: {/webPreferences: {\n      contextIsolation: false,/}' src/main/window.js
}

build() {
  cd "${srcdir}/gotomeeting-linux-desktop-${pkgver}"
  # runtime dependencies only; electron and electron-builder are not needed
  yarn install --production --frozen-lockfile
}

package() {
    cd "${srcdir}/gotomeeting-linux-desktop-${pkgver}"

    # application
    install -d -m755 "${pkgdir}/usr/lib/${pkgname}"
    cp -R package.json src node_modules "${pkgdir}/usr/lib/${pkgname}/"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;

    # launcher
    install -d -m755 "${pkgdir}/usr/bin"
    printf '#!/bin/sh\nexec electron /usr/lib/%s "$@"\n' "${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # desktop entry
    install -Dm644 "${srcdir}/GoToMeeting.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # icon
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # license
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
