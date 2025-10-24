# Maintainer: Jérôme Mulsant <jerome@rue-de-la-vieille.fr>
_appname=cca
pkgname=ccae-git
pkgver=3.5.5.r0.gc035127
pkgrel=1
epoch=
pkgdesc="Colour Contrast Analyser (CCA) - Checks color contrast against WCAG criteria."
arch=('x86_64')
_electron=electron35
url="https://developer.paciellogroup.com/color-contrast-checker/"
license=(GPL-3.0-only)
depends=("$_electron" 'imlib2' 'hicolor-icon-theme' 'nodejs')
makedepends=('asar' 'git' 'npm' 'libxcrypt-compat')
source=("$pkgname::git+https://github.com/ThePacielloGroup/CCAe.git"
    "cca.desktop")
noextract=()
sha256sums=('SKIP'
            '573202ba311de756575dca1bf5d6469d352c1155afdd3347c79949d7cfcf053c')

pkgver() {
    cd $pkgname
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    _version="$(</usr/lib/${_electron}/version)"
    cd "$pkgname"
    npm install
    npm audit fix
    npx electron-builder build --linux --x64 -l tar.xz \
        -c.electronDist="/usr/lib/$_electron" \
        -c.electronVersion="$_version"
}

package() {

    install -Dm0644 cca.desktop -t "${pkgdir}/usr/share/applications/${_appname}"

    cd "${srcdir}/${pkgname}/build"

    # Install icons
    resolutions=(16x16 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for resolution in "${resolutions[@]}"
    do
        install -Dm0644 "${resolution}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/${_appname}.png"
    done

    install -Dm0644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

    cd "${srcdir}/${pkgname}/dist/linux-unpacked"

    install -Dm755 /dev/null "${pkgdir}/usr/bin/${_appname}"
    cat >> "${pkgdir}/usr/bin/${_appname}" <<EOD
#!/usr/bin/bash
exec $_electron /usr/lib/$pkgname "\$@"
EOD

    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
