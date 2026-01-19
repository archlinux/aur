# Maintainer: Alexander Mot <alexander@amot.dev>
pkgname=metaelite-proton
pkgver=1.01
pkgrel=1
epoch=
pkgdesc="Role playing environment for stories in Elite Dangerous. Runs in ED's Proton-GE prefix"
arch=('any')
url="https://raxxla.org"
license=('custom')
groups=()
depends=('protontricks' 'proton-ge-custom')
makedepends=('msitools' 'icoutils')
checkdepends=()
optdepends=()
provides=('metaelite')
conflicts=()
replaces=()
backup=()
options=()
install=metaelite-proton.install
changelog=
source=("https://cdn.raxxla.org/install/MetaElite-${pkgver}.msi"
        "metaelite-proton"
		"metaelite-proton.desktop")
md5sums=('c0ddc57f6b545dc76a0a964d06948a95'
         'afe5965bc05c378cf362ff515d287203'
         'e039e8c693ba247fb0bd2186d4ad5831')
noextract=()
validpgpkeys=()

package() {
    # Extract MSI
    msiextract "MetaElite-${pkgver}.msi" -C "$srcdir"

    # Install binaries
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/raxxla.org/MetaElite/"* "${pkgdir}/opt/${pkgname}/"

    # Rename exe and its matching cfg to be version-agnostic
    mv "$pkgdir/opt/$pkgname/MetaElite-${pkgver}.exe" "$pkgdir/opt/$pkgname/MetaElite.exe"
    mv "$pkgdir/opt/$pkgname/app/MetaElite-${pkgver}.cfg" "$pkgdir/opt/$pkgname/app/MetaElite.cfg"

    # Install wrapper script
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Create icons
    mkdir -p icons
    msg2 "Extracting icons..."
    wrestool -x -t 14 "${pkgdir}/opt/${pkgname}/MetaElite.exe" -o metaelite.ico                                                                 
    icotool -x metaelite.ico -o icons/

    # Install icons (auto-detect valid sizes)
    cd icons
    for icon in *.png; do
        res=$(echo "$icon" | cut -d'_' -f3 | cut -d'x' -f1)
        if [[ "$res" =~ ^(16|24|32|48|64|96|128|256)$ ]]; then
            install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
        fi
    done
}
