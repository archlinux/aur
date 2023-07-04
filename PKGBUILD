# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=4.7
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="x86_64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"
_appimage="eID_klient-${_upstream_arch}.AppImage"
_url="https://eidas.minv.sk/downloadservice/eidklient/linux"
source_i686=("${_url}/eID_klient_i386.tar.gz")
source_x86_64=("${_url}/eID_klient_x86_64.tar.gz")
# upstream update would break this PKGBUILD if we used integrity checks
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")
install=eidklient.install

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

pkgver() {
    strings "${srcdir}/squashfs-root/eID_Client" | grep -Pom1 '^eID_klient_v\K[0-9.]+'
}

package() {
    depends=( "pcsclite" "ccid" "fuse2" )
    optdepends=('disig-web-signer: online certificates update support')

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    # It seems this is unnecessary (however it's done like this in the upstream package)
    #ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/VirtualKeyboard"

    install -dm755 "${pkgdir}/usr/lib/eID_klient"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/lib/eID_klient/VirtualKeyboard"

    install -m644 ${srcdir}/squashfs-root/lib/libCardAPI* "${pkgdir}/usr/lib/eID_klient/"
    install -m644 ${srcdir}/squashfs-root/lib/libbotan* "${pkgdir}/usr/lib/eID_klient/"
    install -m644 ${srcdir}/squashfs-root/lib/libpkcs11_* "${pkgdir}/usr/lib/eID_klient/"
    install -m644 ${srcdir}/squashfs-root/lib/libcrypto* "${pkgdir}/usr/lib/eID_klient/"
    install -m644 ${srcdir}/squashfs-root/lib/libssl* "${pkgdir}/usr/lib/eID_klient/"

    # Icons + desktop file
    tar -x -C "${pkgdir}/usr" -f "${srcdir}/squashfs-root/share.tar"

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=[^ ]*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "${pkgdir}/usr/share/applications/eID_klient.desktop"
}
