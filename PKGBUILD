# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=shadps4-nightly-bin
_pkgname=shadPS4
_pkgid=net.shadps4.shadPS4
pkgver=2025.10.06.b345567
_date=2025-10-06
_commit=b34556702ec46e322c6df39b48d3bd2d92d361ff
_shortcommit=b345567
pkgrel=1
pkgdesc="Unofficial nightly release of the shadPS4 PlayStation 4 emulator (Nightly pre-release version)"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
options=('!strip')
provides=('shadps4')
conflicts=('shadps4')
_appimage=Shadps4-qt.AppImage
source=("shadps4-linux-qt-${_date}-${_shortcommit}.zip::https://github.com/shadps4-emu/shadPS4/releases/download/Pre-release-shadPS4-${_date}-${_commit}/shadps4-linux-qt-${_date}-${_shortcommit}.zip")
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
