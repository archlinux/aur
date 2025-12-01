# Maintainer: Alexander Mot <alexander@amot.dev>
pkgname=eddiscovery-proton
pkgver=19.0.12
pkgrel=1
epoch=
pkgdesc="Captains log and 3d star map for Elite Dangerous. Runs in ED's Proton-GE prefix"
arch=('any')
url="https://github.com/EDDiscovery/EDDiscovery"
license=('Apache')
groups=()
depends=('protontricks' 'proton-ge-custom' 'hicolor-icon-theme')
makedepends=('icoutils')
checkdepends=()
optdepends=('ttf-ms-fonts')
provides=('eddiscovery')
conflicts=('eddiscovery')
replaces=()
backup=()
options=()
install=eddiscovery-proton.install
changelog=
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/Release_${pkgver}/EDDiscovery.Portable.$pkgver.zip"
        "eddiscovery-proton"
		"eddiscovery-proton.desktop")
md5sums=('5e17d95f531e9556b7de60e95778ee18'
         'e4c15c73cfd8083eb070f16757817f54'
         'a8c216a08d8e75a133236983e6458803')
noextract=()
validpgpkeys=()

prepare() {
  mkdir -p icons
}

build() {
    msg2 "Extracting icons..."
    wrestool -x -t 14 EDDiscovery.exe -o eddiscovery.ico
    icotool -x eddiscovery.ico -o icons/
}

package() {
    # Install binaries
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r * "${pkgdir}/opt/${pkgname}/"

    # Cleanup source artifacts from /opt
    rm -rf "${pkgdir}/opt/${pkgname}/icons" 
    rm -f "${pkgdir}/opt/${pkgname}/eddiscovery.ico"
    rm -f "${pkgdir}/opt/${pkgname}/${pkgname}"
    rm -f "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.zip"

    # Install wrapper script
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icons (auto-detect valid sizes)
    cd icons
    for icon in *.png; do
        res=$(echo "$icon" | cut -d'_' -f4 | cut -d'x' -f1)
        if [[ "$res" =~ ^(16|24|32|48|64|96|128|256)$ ]]; then
            install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
        fi
    done
}
