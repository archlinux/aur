# Maintainer: liranv <liranvaknin@gmail.com>

pkgname=shadps4-qtlauncher-bin
_pkgname=shadPS4QtLauncher
_pkgid=net.shadps4.shadps4-qtlauncher
pkgver=2026.03.15.d961f92
_date=2026-03-15
_commit=d961f92bda8afe05541690738271ebd53ddd0188
_shortcommit=d961f92
pkgrel=1
pkgdesc="shadPS4 PlayStation 4 emulator Qt launcher"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
options=('!strip')
provides=('shadps4-qtlauncher')
conflicts=('shadps4-qtlauncher')
_appimage=shadPS4QtLauncher-qt.AppImage
source=("shadPS4QtLauncher-linux-qt-${_date}-${_shortcommit}.zip::https://github.com/shadps4-emu/shadps4-qtlauncher/releases/download/shadPS4QtLauncher-2026-03-15-d961f92bda8afe05541690738271ebd53ddd0188/shadPS4QtLauncher-linux-qt-2026-03-15-d961f92.zip")
sha256sums=('7a749e4bd41601bffec99ec638348fbf2fbcf875e8df3682a38d30543ced4026')

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
    install -dm755 "$pkgdir/opt/${_pkgname}"
    mv "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/shadps4-qtlauncher"
    install -Dm644 "$pkgdir/opt/${_pkgname}/usr/share/icons/hicolor/scalable/apps/net.shadps4.shadPS4.svg" "$pkgdir/usr/share/pixmaps/net.shadps4.shadps4-qtlauncher.svg"
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.desktop" -t "$pkgdir/usr/share/applications"
    sed -i "s|Exec=shadPS4QtLauncher|Exec=shadps4-qtlauncher|" "$pkgdir/usr/share/applications/${_pkgid}.desktop"
    sed -i "s|Icon=net.shadps4.shadPS4|Icon=${_pkgid}|" "$pkgdir/usr/share/applications/${_pkgid}.desktop"
    chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
