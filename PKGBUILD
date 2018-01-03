# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>

pkgname=pokemon-revolution-online-bin
pkgver=0.98.3.jolly.ol.snorlax
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="https://pokemon-revolution-online.net"
license=('custom')
depends=('gcc-libs' 'desktop-file-utils')
makedepends=('unzip' 'xdg-utils')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
install="INSTALL"
source=('net.pokemon-revolution-online.desktop' 'pokemonrevolution' 'copyright' 'pokemonrevolution.svg')
sha256sums=('64b5c6c47cd0705ff743fe3a14a0c71899db29f70f699d94cdf6f54e3fa13d00'
            '4f3964f11bf6379df123eae488948c0d93f8432a6e546318b6c609085226c4e2'
            'df736901de54dce3b191bd9744732f7b9970ab3cbdece8d7fbd7122e69ce32d5'
            '54b5f40a5385eba58385c49b7ba6a4485d531acdb6289c3cb97dcf6825750956')

package() {
    cd "${srcdir}"

    # Variables
    ## i know this isn't a good thing and nobody wants to see this on aur, but it'll make things easier for me #Fabian
    ## directory files naming is usually VNAMING_Date, binary VNAMING.x86_64
    __VNAMING="PROLinux64" ##like PROLinux95_45_data, PROLinux95_45.x86_64

    __DLDIR=$(xdg-user-dir DOWNLOAD) ##downloaddirectory
    __DDLA="https://tiny.cc/PROLinux" ##download link
    __DDLFN="PROLinux64.zip" ##filename
    __DDLFSHA256="4998dd3eaa8c441ad08d9ae0128705e5b520e8b9511a050b2c9aaeb8b623a7bb" #sha256sum

    ## "Something's missing"? -> No One Cares - Atreyu c;
    if [ ! -f ${__DLDIR}/${__DDLFN} ]; then
    {
        echo "${__DLDIR}/${__DDLFN} not found, please download it"
        echo "Download: ${__DDLA}"
        exit 1
    }
    fi
    ## lets check the sha256sum
    if [ "$(sha256sum ${__DLDIR}/${__DDLFN} | awk '{print $1}')" != "${__DDLFSHA256}" ]; then
    {
        echo "${__DLDIR}/${__DDLFN} SHA256 MISMATCH, please remove the old file before downloading"
        echo "rm \"${__DLDIR}/${__DDLFN}\""
        echo "Download: ${__DDLA}"
        echo
        echo "maybe this pkgbuild is out-of-date. please report this:"
        echo "https://aur.archlinux.org/packages/pokemon-revolution-online-bin/"
        exit 1
    }
    fi

    #bsdtar -x -p -f "${__DLDIR}/${__DDLFN}"
    ## we're using unzip for now, since bsdtar cant handle the zip file
    ## bsdtar: Invalid central directory signature
    ## bsdtar: Error exit delayed from previous errors.
    unzip "${__DLDIR}/${__DDLFN}"

    # CREATE FOLDERS
    ## copy the folderstructure of the original without content.
    /usr/bin/find "." -type d -exec \
        install -d -m755 "${pkgdir}/opt/Pokemon Revolution/{}" \;

    # MOVE CONTENT
    ## minimize memory usage by using mv instead of install
    ## this also fits more in our "permissions" to use it hashtag copyright, hashtag do NOT modify anything
    /usr/bin/find "./${__VNAMING}_Data" \
        -type f -exec /usr/bin/mv "{}" "${pkgdir}/opt/Pokemon Revolution/{}" \; -exec /usr/bin/chmod 644 "${pkgdir}/opt/Pokemon Revolution/{}" \;
    ## move to new position
    /usr/bin/mv "${srcdir}/${__VNAMING}.x86_64" "${pkgdir}/opt/Pokemon Revolution/${__VNAMING}.x86_64"
    ## set permission
    /usr/bin/chmod 755 "${pkgdir}/opt/Pokemon Revolution/${__VNAMING}.x86_64"

    #MOVE ICON
    ## cause we can not use the iroginal icon, we use a *.svg version.
    install -D -m644 "${srcdir}/pokemonrevolution.svg" \
    "${pkgdir}/usr/share/pixmaps/pokemonrevolution.svg"

    # DESKTOP FILE
    ## Set the path to our pokemon scriptfile
    /usr/bin/sed -i "s/GAMEEXECPATHSETBYPKGBUILD/\/usr\/bin\/pokemonrevolution/" "${srcdir}/net.pokemon-revolution-online.desktop"
    ## let's Install the *.desktop file
    install -D -m644 "${srcdir}/net.pokemon-revolution-online.desktop" \
    "${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop"

    # START SCRIPT
    ## set the correct directory
    /usr/bin/sed -i "s/GAMEDIRNAMESETBYPKGBUILD/\/opt\/Pokemon\ Revolution/" "${srcdir}/pokemonrevolution"
    ## set the correct filename
    /usr/bin/sed -i "s/GAMEBINARYNAMESETBYPKGBUILD/${__VNAMING}.x86_64/" "${srcdir}/pokemonrevolution"

    ## move it!
    install -D -m755 "${srcdir}/pokemonrevolution" \
    "${pkgdir}/usr/bin/pokemonrevolution"

    # COPYRIGHT FILE
    ## move the copyright text
    install -D -m644 "${srcdir}/copyright" \
    "${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
