# Maintainer: Guillaume Hayot <postblue@postblue.info>

pkgname=trine_enchanted_edition
pkgver=2_12
_build=508
pkgrel=1
pkgdesc="Trine Enchanted Edition is a beautiful fantasy action platformer with a fairytale-like atmosphere"
arch=('i686' 'x86_64')
url="http://www.frozenbyte.com/games/trine-enchanted-edition"
depends=('xorg-xwininfo' 'desktop-file-utils')
depends_i686=('glu' 'libxxf86vm' 'openal' 'libdrm')
depends_x86_64=('lib32-glu' 'lib32-libxxf86vm' 'lib32-openal' 
                'lib32-libdrm' 'lib32-libvorbis' 'lib32-freetype2' 
                'lib32-portaudio' 'lib32-gtk2' 'lib32-gdk-pixbuf2')
optdepends=('lib32-gtk-engine-murrine: Fixes the Gtk-WARNING error about « murrine »'
            'lib32-gtk-engines: Fixes the Gtk-WARNING about « adwaita »')
install="${pkgname}.install"
source=("hib://${pkgname}_v${pkgver}_build_${_build}_humble_linux_full.zip"
        "trine_enchanted_edition.desktop")
md5sums=('a09473c82080af0db3e1a5d96ea5dc0f'
         'b841096f6ceff8f0b5f451f9b69500da')
PKGEXT=".pkg.tar"
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
    # copy game files
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/linux/_enchanted_edition_/"* "${pkgdir}/opt/${pkgname}"

    # install desktop file and icon
    mkdir -p "${pkgdir}"/usr/share/{pixmaps,applications}
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/trine1.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/${pkgname}" << \here
#!/bin/sh
cd /opt/trine_enchanted_edition
sh trine1.sh
here

    # Make scripts and binaries executable
    chmod a+x "${pkgdir}/usr/bin/${pkgname}"
    chmod a+x "${pkgdir}/opt/${pkgname}/bin/trine1_linux_launcher_32bit"
    chmod a+x "${pkgdir}/opt/${pkgname}/bin/trine1_linux_32bit"
    chmod a+x "${pkgdir}/opt/${pkgname}/bin/trine1_bin_starter.sh"
}
