# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>
pkgname=pokemon-revolution-online
pkgver=0.93_3.20160206
pkgrel=2
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="http://pokemon-revolution-online.net"
license=('custom')
depends=('gcc-libs-multilib')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
changelog="change.log"
source=('http://tiny.cc/PROLinux' 'net.pokemon-revolution-online.desktop' 'change.log' 'pokemonrevolution' 'copyright' 'pokemonrevolution.svg')
md5sums=('ac29bdb95a865efc8f043fff5d9720cb'
         '3598d5900062503b4b6b5e43eff612a8'
         '17c1e76c812c75ab28b6a2fe7beb4638'
         '1b667f450341675b6b2c1750e034516c'
         '0efcd0393015ff149217f9ced4670513'
         '8446ead3097e1b87e3a63b667d956569')

package() {
    cd "${srcdir}"

    # CREATE FOLDERS
    ## copy the folderstructure of the original without content.    
    /usr/bin/find "." -type d -exec \
        install -d -m755 "${pkgdir}/opt/Pokemon Revolution/{}" \;

    # MOVE CONTENT
    ## minimize memory usage by using mv instead of install
    ## this also fits more in our "permissions" to use it hashtag copyright, hashtag do NOT modify anything
    /usr/bin/find "./PROLinux64_93_3_Data" \
        -type f -exec /usr/bin/mv "{}" "${pkgdir}/opt/Pokemon Revolution/{}" \; -exec /usr/bin/chmod 644 "${pkgdir}/opt/Pokemon Revolution/{}" \;
    ## move to new position
    /usr/bin/mv "${srcdir}/PROLinux64_93_3.x86_64" "${pkgdir}/opt/Pokemon Revolution/PROLinux64_93_3.x86_64"
    ## set permission
    /usr/bin/chmod 755 "${pkgdir}/opt/Pokemon Revolution/PROLinux64_93_3.x86_64"

    #MOVE ICON
    ## cause we can not use the iroginal icon, we use a *.svg version.
    install -D -m644 "${srcdir}/pokemonrevolution.svg" \
    "${pkgdir}/usr/share/pixmaps/pokemonrevolution.svg"

    # DESKTOP FILE
    ## Set the path to our pokemon scriptfile
    /usr/bin/sed -i 's/GAMEEXECPATHSETBYPKGBUILD/\/usr\/bin\/pokemonrevolution/' "${srcdir}/net.pokemon-revolution-online.desktop"
    ## let's Install the *.desktop file
    install -D -m644 "${srcdir}/net.pokemon-revolution-online.desktop" \
    "${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop" 

    # START SCRIPT
    ## set the correct directory
    /usr/bin/sed -i 's/GAMEDIRNAMESETBYPKGBUILD/\/opt\/Pokemon\ Revolution/' "${srcdir}/pokemonrevolution"
    ## set the correct filename
    /usr/bin/sed -i 's/GAMEBINARYNAMESETBYPKGBUILD/PROLinux64_93_3.x86_64/' "${srcdir}/pokemonrevolution"

    ## move it!
    install -D -m755 "${srcdir}/pokemonrevolution" \
    "${pkgdir}/usr/bin/pokemonrevolution"

    # COPYRIGHT FILE
    ## move the copyright text
    install -D -m644 "${srcdir}/copyright" \
    "${pkgdir}/usr/share/licenses/pokemon-revolution-online/copyright"

    # RM PROLinux
    ## lets remove the zip file since it'll save some space and we dont need it anymore
    rm ../PROLinux
}
