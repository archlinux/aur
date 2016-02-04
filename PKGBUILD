# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>
pkgname=pokemon-revolution-online
pkgver=0.93_2.20160202
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="http://pokemon-revolution-online.net"
license=('custom')
depends=('gtk2' 'gcc-libs-multilib')
changelog="change.log"
source=('http://tiny.cc/PROLinux' 'net.pokemon-revolution-online.desktop' 'change.log' 'pokemonrevolutiononline' 'copyright')
md5sums=('a1f1608a265a1403783b4db1bc9ce3a7'
         '78b5c727a2d8fc7f0345c5fec70a4391'
         '45283e61aa362298cc1ee6eb0334ba4c'
         '67888930993d90b75a61d040fa930980'
         '0efcd0393015ff149217f9ced4670513')

package() {
    cd "${srcdir}"

    # CREATE FOLDERS
    ## copy the folderstructure of the original without content.    
    /usr/bin/find "." -type d -exec \
        install -d -m755 "${pkgdir}/opt/pokemonrevolutiononline/{}" \;

    # MOVE CONTENT
    ## minimize memory usage by using mv instead of install
    ## this also fits more in our "permissions" to use it hashtag copyright, hashtag do NOT modify anything
    /usr/bin/find "./PROLinux93_2_Data" \
        -type f -exec /usr/bin/mv "{}" "${pkgdir}/opt/pokemonrevolutiononline/{}" \; -exec /usr/bin/chmod 644 "${pkgdir}/opt/pokemonrevolutiononline/{}" \;
    ## move to new position
    /usr/bin/mv "${srcdir}/PROLinux93_2.x86_64" "${pkgdir}/opt/pokemonrevolutiononline/PROLinux93_2.x86_64"
    ## set permission
    /usr/bin/chmod 755 "${pkgdir}/opt/pokemonrevolutiononline/PROLinux93_2.x86_64"

    # DESKTOP FILE
    ## use the full path to get the icon, since the license don't allows us to copy/rename a file to a directory for pixmaps.
    /usr/bin/sed -i 's/GAMEICONPATH/\/opt\/pokemonrevolutiononline\/PROLinux93_2_Data\/Resources\/UnityPlayer.png/' "${srcdir}/net.pokemon-revolution-online.desktop"
    ## let's Install the *.desktop file
    install -D -m644 "${srcdir}/net.pokemon-revolution-online.desktop" \
    "${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop" 

    # START SCRIPT
    ## set the correct filename
    /usr/bin/sed -i 's/GAMEBINARYNAME/PROLinux93_2.x86_64/' "${srcdir}/pokemonrevolutiononline"
    ## move it!
    install -D -m755 "${srcdir}/pokemonrevolutiononline" \
    "${pkgdir}/usr/bin/pokemonrevolutiononline"

    # COPYRIGHT FILE
    ## move the copyright text    
    install -D -m644 "${srcdir}/copyright" \
    "${pkgdir}/usr/share/licenses/pokemon-revolution-online/copyright" 

    # RM PROLinux
    ## lets remove the zip file since it'll save some space and we dont need it anymore
    rm ../PROLinux
}
