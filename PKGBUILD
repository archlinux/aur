# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=ozone
pkgver=3.50a
pkgrel=2
epoch=32
pkgdesc="Segger Ozone JLink debugger for Linux"
arch=('x86_64')
license=('custom')
groups=('jlink')
replaces=('jlink-debugger')
conflicts=('jlink-debugger')
provides=('jlink-debugger')
depends=('jlink-software-and-documentation>=5.10n')
source_x86_64=("Ozone_Linux_V${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/jlink/Ozone_Linux_V${pkgver/./}_x86_64.tgz")
source=("Ozone.desktop" "Ozone.svg")
md5sums_x86_64=('25194f1555a757a091ff6187e024d2f3')
md5sums=('d1d2aa1b868487207ad256ebc8235982' 'f7c46fe903305c37f38f846b18318b38')

url="https://www.segger.com/jlink-software.html"
options=(!strip)

package(){
    mv Ozone_Linux_V${pkgver/./}_x86_64 Ozone

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Ozone" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/" \
            "${pkgdir}/usr/share/pixmaps" \
            "${pkgdir}/usr/share/applications"

    # Install desktop entry
    install -Dm644 "Ozone.desktop" "${pkgdir}/usr/share/applications/Ozone.desktop"
    install -Dm644 "Ozone.svg" "${pkgdir}/usr/share/pixmaps/Ozone.svg"

    cd ${srcdir}/Ozone

    # Make permissions right
    find . -type d | xargs -i'{}' chmod a+rx '{}'
    find . -type f | xargs -i'{}' chmod a+r '{}'

    # Remove un-needed files
    find . -name ".svn" | xargs rm -rf

    # Bulk copy everything
    cp -ax Ozone ozone ozone-sim Plugins Doc Config Lib Ozone.png Examples "${pkgdir}/opt/SEGGER/Ozone"

    # Create links where needed
    ln -s /opt/SEGGER/Ozone/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/Ozone/Ozone "${pkgdir}/usr/bin"
    ln -s /opt/SEGGER/Ozone/ozone-sim "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/Ozone/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
