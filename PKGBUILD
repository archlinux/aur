# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>
pkgname=pokemon-revolution-online-bin
pkgver=0.96.pink.weedle.20170205
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="http://pokemon-revolution-online.net"
license=('custom')
depends=('gcc-libs-multilib' 'xdg-utils' 'desktop-file-utils')
makedepends=('unzip')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
install="INSTALL"
source=('net.pokemon-revolution-online.desktop' 'pokemonrevolution' 'copyright' 'pokemonrevolution.svg')
md5sums=('3215173b6f1673d868e71f1d953ed9d2'
         '468427350f89449698740c8d2aae581e'
         '0efcd0393015ff149217f9ced4670513'
         '8446ead3097e1b87e3a63b667d956569')

package() {
    cd "${srcdir}"

    # Variables
    ## i know this isnt a good thing and nobody wants to see this on aur, but itll make things easier for me #Fabian
    ## directory files naming is usually VNAMING_Date, binary VNAMING.x86_64
    __VNAMING="PROLinux64" ##like PROLinux95_45_data, PROLinux95_45.x86_64

    __DLDIR=$(xdg-user-dir DOWNLOAD) ##downloaddirectory
    __DDLA="http://tiny.cc/PROLinux" ##download link
    __DDLFN="PROLinux64Weedle.zip" ##filename
    __DDLFMD5="bea5e30c13c17374970eef9923e0ffbe" #md5sum

    ## "Something's missing"? -> No One Cares - Atreyu c;
    if [ ! -f ${__DLDIR}/${__DDLFN} ]; then
    {
        echo "${__DLDIR}/${__DDLFN} not found, please download it"
        echo "Download: ${__DDLA}"
        exit 1
    }
    fi
    ## lets check the md5sum
    if [ "$(md5sum ${__DLDIR}/${__DDLFN} | awk '{print $1}')" != "${__DDLFMD5}" ]; then
    {
        echo "${__DLDIR}/${__DDLFN} MD5 MISMATCH, please remove the old file before downloading"
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
