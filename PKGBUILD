# Maintainer: Ivelin Velkov <ivelin dot velkov at gmail dot com>

pkgname=teams-for-linux
pkgver=0.0.7
pkgrel=2
pkgdesc='Unofficial Microsoft Teams client for Linux using Electron.'
arch=('any')
url='https://github.com/ivelkov/teams-for-linux'
license=('GPLv3')
depends=( 'nodejs' 'electron' 'xdg-utils')
makedepends=( 'npm' )
provides=("${teams-for-linux}-${pkgver}")
conflicts=("${teams-for-linux}-${pkgver}")
source=("https://github.com/ivelkov/$pkgname/archive/v$pkgver.tar.gz")

sha1sums=('SKIP')

prepare() {
    cat > "${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Teams
Comment=Unofficial Microsoft Teams client for Linux.
Exec=/usr/bin/${pkgname}
Icon=/usr/share/icons/hicolor/1024x1024/apps/teams-for-linux.png
Categories=Network;InstantMessaging;Application;
Terminal=false
StartupNotify=true
Version=${pkgver}
EOF

    cat > "${pkgname}" << EOF
#!/usr/bin/env sh
electron /usr/share/${pkgname}/app \$*
EOF
}

build() {
    cd "$pkgname-$pkgver"
    npm i && (cd app && npm i)
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r --preserve=mode . "${pkgdir}/usr/share/${pkgname}"
    
    install -Dm644 "build/icons/1024x1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/teams-for-linux.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/teams"
}
