# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=4.1
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="x86_64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"
_appimage="eID_klient-${_upstream_arch}.AppImage"
_url="https://eidas.minv.sk/downloadservice/eidklient/linux/"
source=("${_url}/eID_klient_release_notes.txt")
source_i686=("${_url}/${_appimage}")
source_x86_64=("${_url}/${_appimage}")
# upstream update would break this PKGBUILD if we used integrity checks
md5sums=('SKIP')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")
install=eidklient.install

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

pkgver() {
       # Match version from upstream release notes
       cat eID_klient_release_notes.txt | grep "verzia" | head -n1 | sed 's/^.*verzia \([0-9.]*\).*/\1/'
}

package() {
    depends=( "pcsclite" "ccid" "squashfuse" )
    optdepends=('disig-web-signer: online certificates update support')

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Icons + desktop file
    tar -x -C "${pkgdir}/usr" -f "${srcdir}/squashfs-root/share.tar"

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=[^ ]*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "${pkgdir}/usr/share/applications/eID_klient.desktop"
}
