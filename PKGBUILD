# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>
pkgname=airmanager
pkgver=5.3.0
pkgrel=1
pkgdesc="Flight simulator instrument panels"
arch=('x86_64')
url="https://siminnovations.com/"
license=('custom:proprietary')
depends=('gtk3' 'freeimage' 'curl' 'libusb' 'libva' 'libdrm' 'libepoxy'
         'libglvnd' 'freetype2' 'fontconfig' 'alsa-lib' 'libx11' 'libxi'
         'libxrandr' 'libxrender' 'libxtst' 'libxxf86vm' 'libxext'
         'gcc-libs' 'zlib' 'openssl' 'systemd-libs')
makedepends=('unzip')
options=('!strip' '!debug')
source=("airmanager.zip::https://api6.siminnovations.com/application/download/b2e884a4-0021-49e5-2865-37ef2442e767"
        "airmanager.desktop"
        "airmanager.sh")
sha256sums=('c457e9b664bb444773f45131dfdcf2799a38f610beb81b4854e100a801126f00'
            '04559fa799c251723a85ee64f77c41b9622bc0eb967ed7da8e720b32c955f2a8'
            '6e953c8de07e99822aafa8089e8232499021b11d506e8dbec036d74f4e1aeae6')
noextract=('airmanager.zip')

prepare() {
    cd "${srcdir}"

    # Extract AirManager into its own clean directory
    rm -rf AirManager
    mkdir -p AirManager
    unzip -qo airmanager.zip -d AirManager/
}

package() {
    cd "${srcdir}"

    # Install main application (includes bundled JRE)
    install -dm755 "${pkgdir}/opt/airmanager"
    cp -a AirManager/* "${pkgdir}/opt/airmanager/"

    # Remove setup scripts meant for other distributions
    rm -f "${pkgdir}/opt/airmanager/setup.sh" \
          "${pkgdir}/opt/airmanager/install_desktop_file.sh"

    # Install udev rules for the Knobster hardware
    if [ -f "${pkgdir}/opt/airmanager/99-knobster.rules" ]; then
        install -Dm644 "${pkgdir}/opt/airmanager/99-knobster.rules" "${pkgdir}/usr/lib/udev/rules.d/99-knobster.rules"
        rm -f "${pkgdir}/opt/airmanager/99-knobster.rules"
    fi

    # Make sure the bootloader and bundled JRE helpers are executable
    chmod +x "${pkgdir}/opt/airmanager/Bootloader" \
             "${pkgdir}/opt/airmanager/jre/bin/"* \
             "${pkgdir}/opt/airmanager/jre/lib/jexec" \
             "${pkgdir}/opt/airmanager/jre/lib/jspawnhelper"

    # Install executable wrapper
    install -Dm755 airmanager.sh "${pkgdir}/usr/bin/airmanager"

    # Install desktop entry and icon
    install -Dm644 airmanager.desktop "${pkgdir}/usr/share/applications/airmanager.desktop"
    install -Dm644 AirManager/manager_icon.png "${pkgdir}/usr/share/pixmaps/airmanager.png"
}