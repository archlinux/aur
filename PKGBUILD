# Maintainer: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux
_pkgname=teams-for-linux-0.0.7
pkgver=0.0.7
pkgrel=1
pkgdesc='Unofficial Microsoft Teams client for Linux using Electron.'
arch=('any')
url='https://github.com/ivelkov/teams-for-linux'
license=('GPLv3')
depends=('electron' 'xdg-utils')
makedepends=( 'npm' )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/ivelkov/$pkgname/archive/v$pkgver.tar.gz")

sha1sums=('SKIP')
_desktop="${_pkgname}.desktop"

prepare() {
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=Teams
Comment=Unofficial Microsoft Teams client for Linux.
Exec=/usr/bin/${pkgname}
Icon=$pkgdir/usr/share/icons/hicolor/1024x1024/apps/teams-for-linux.png
Categories=Network;InstantMessaging;Application;
Terminal=false
StartupNotify=true
Version=${pkgver}
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
electron /usr/share/${pkgname}/app \$*
EOF
}

build() {
    cd "${_pkgname}"
    npm i && (cd app && npm i)
}

package() {
    cd "${_pkgname}"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cp -r --preserve=mode . "${pkgdir}/usr/share/${pkgname}"
    
    install -Dm644 "build/icons/1024x1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/teams-for-linux.png"
    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/teams"
}
