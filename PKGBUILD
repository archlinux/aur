# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=5.10p
pkgrel=1
pkgdesc="Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=('glibc')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/jlink-software.html?step=1&file=JLinkLinuxTGZ64_${pkgver/./}")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/jlink-software.html?step=1&file=JLinkLinuxTGZ32_${pkgver/./}")
source=('99-jlink.rules.patch')
md5sums=('5e76e4b585db917d45b58a5be51b357d')
md5sums_i686=('fbd705fd8d611cf95014eff8faeebba3')
md5sums_x86_64=('c6399d64f4afcedca21cb81555c3f8be')
install=$pkgname.install
url="https://www.segger.com/jlink-software.html"
conflicts=("j-link-software-and-documentation")
replaces=("j-link-software-and-documentation")
DLAGENTS=("https::/usr/bin/env curl -o %o -d agree=1 -d confirm=yes ")

prepare() {
    # Change src path name
    if [ ${CARCH} = "i686" ]; then
        mv JLink_Linux_V${pkgver/./}_i386 JLink
    else
        mv JLink_Linux_V${pkgver/./}_x86_64 JLink
    fi

    # Remove `BUS!="usb"` from udev rules. BUS isn't valid anymore
    cd ${srcdir}/JLink
    patch -uN 99-jlink.rules ../99-jlink.rules.patch
}

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/JLink" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/etc/udev/rules.d/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/JLink

    # Bulk copy everything
    cp --preserve=mode -r J* Doc Samples README.txt "${pkgdir}/opt/SEGGER/JLink"

    # Create links where needed
    ln -s /opt/SEGGER/JLink/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 99-jlink.rules "${pkgdir}/etc/udev/rules.d/"
    install -Dm755 libjlinkarm.so.*.* "${pkgdir}/usr/lib/"
    ln -s "/usr/lib/libjlinkarm.so.*.*" "${pkgdir}/usr/lib/libjlinkarm.so.${pkgver:0:1}"

    for f in J*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/bin"
    done

    for f in Doc/*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done

    # nrfjprog hardcoded libjlinkarm.so* to be in /opt/SEGGER/JLink (will be fixed in later versions)
    ln -s "/usr/lib/libjlinkarm.so.${pkgver:0:1}" "${pkgdir}/opt/SEGGER/JLink/libjlinkarm.so.${pkgver:0:1}"

}
