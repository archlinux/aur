# Maintainer: pzl <alsoelp@gmail.com>

pkgname=jlink
_pkgver="510g"
pkgver="5.10g"
pkgrel=2
pkgdesc="ARM Embedded debugger and flashing software from Segger"
arch=('i686' 'x86_64')
url="https://www.segger.com/jlink-software.html"
license=('custom') #https://www.segger.com/cms/admin/uploads/userfiles/file/J-Link/license_agreement.txt
depends=('glibc')
source=('udev_fix.patch') #fetching the pkg source requires a POST request, so we must do this in prepare()
md5sums=('8134047402c9ac6dc7c3bc24dfcf51b5')
_md5sums_64=("387771245e86d8e5462c993c2065948e") #underscored because real md5sums must match source array length, ours is missing package URL
_md5sums_32=("5969ff903263c2efbc43cae11a1bd8e7")


prepare() {
    cd "$srcdir"
    if [ "$CARCH" = "x86_64" ]; then
        _ARCH="64"
        _MD5="${_md5sums_64}"
    else
        _ARCH="32"
        _MD5="${_md5sums_32}"
    fi

    #fetch source
    wget -O "${pkgname}.tgz" --post-data="agree=1&confirm=yes" "https://www.segger.com/jlink-software.html?step=1&file=JLinkLinuxTGZ${_ARCH}_${_pkgver}"
    
    #verify
    if [ "$(md5sum "${pkgname}.tgz" | cut -d' ' -f1)" != "${_MD5}" ]; then
        echo "md5 source verification failed" >&2
        exit 1
    fi

    #extract
    tar -xzvf "${pkgname}.tgz"
}

build() {
    #remove `BUS!="usb"` from udev rules. BUS isn't valid anymore
    cd "${srcdir}"/JLink_Linux_V*
    patch -uN 99-jlink.rules ../udev_fix.patch
}

package() {
    cd "${srcdir}"/JLink_Linux_V*

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/JLink" \
                    "${pkgdir}/usr/share/licenses/${pkgname}" \
                    "${pkgdir}/usr/share/doc/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/etc/udev/rules.d" \
                    "${pkgdir}/usr/lib"
    cp --preserve=mode -r "." "${pkgdir}/opt/SEGGER/JLink"

    

    ln -s /opt/SEGGER/JLink/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s /opt/SEGGER/JLink/Doc "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s /opt/SEGGER/JLink/99-jlink.rules "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

    for f in JLink*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/bin"
    done

    for f in libjlinkarm*; do
        ln -s /opt/SEGGER/JLink/"$f" "${pkgdir}/usr/lib"
    done
}
