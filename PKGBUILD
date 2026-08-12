# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=ppsspp-bin
_pkgname=ppsspp
pkgver=1.20.4
pkgrel=2
pkgdesc="A PSP emulator for Android, Windows, Mac and Linux, written in C++"
arch=('x86_64')
url="https://www.ppsspp.org/"
license=("GPL-2.0-or-later")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=(
    'libgcc' 'glibc' 'util-linux-libs' 'zstd'
    'libelf' 'zlib' 'libstdc++' 'glib2'
    'python' 'expat' 'dbus' 'bzip2' 'pcre2'
    'systemd-libs' 'bash' 'libffi' 'brotli'
    )
options=('!strip' '!debug' '!emptydirs')
_appimage=PPSSPP-v${pkgver}-anylinux-x86_64.AppImage
noextract=("${_appimage}")
source=("https://github.com/hrydgard/ppsspp/releases/download/v${pkgver}/${_appimage}")
sha256sums=('661c098e6b7f7610171a57b7c533ce8bba6f2312b71e76d61e850461973eba21')

prepare() {
    # Extract AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    cd "${srcdir}/squashfs-root/"
    mv "PPSSPPSDL.desktop" "$_pkgname.desktop"
    sed -i -e "s/Exec=PPSSPPSDL/Exec=ppsspp/" "$_pkgname.desktop"
    sed -i 's|APPDIR=$(cd "${0%/\*}" && echo "$PWD")|APPDIR=/opt/ppsspp|' "AppRun"
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    # Move extracted content to /opt
    cp -rp "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    # Install the .desktop file and the icon
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    # Create a symbolic link for the AppRun
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
