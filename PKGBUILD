# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=shadps4-nightly-bin
_pkgname=shadPS4
_pkgid=net.shadps4.shadPS4
pkgver=2025.10.16.175156c
_date=2025-10-16
_commit=175156c74141dd55998d0baf8752b7efdbb6ee2d
_shortcommit=175156c
pkgrel=1
pkgdesc="Nightly release of the shadPS4 PlayStation 4 emulator (Qt launcher)"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
options=('!strip')
provides=('shadps4')
conflicts=('shadps4')
_appimage=shadPS4QtLauncher-qt.AppImage
source=("shadps4-linux-qt-${_date}-${_shortcommit}.zip::https://github.com/mdmrk/shadps4-nightly-bin/releases/download/v2025.10.16.175156c/shadps4-linux-qt-2025-10-16-175156c.zip")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed -i "s|this_dir=\"\$(readlink -f \"\$(dirname \"\$0\")\")\"|this_dir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
    install -dm755 "$pkgdir/opt/${_pkgname}"
    mv "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/shadps4"
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.svg" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.desktop" -t "$pkgdir/usr/share/applications"
    chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
