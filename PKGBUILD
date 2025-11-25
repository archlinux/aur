# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=shadps4-qtlauncher-pre-release-bin
_pkgname=shadPS4QtLauncher
_pkgid=net.shadps4.shadPS4
_url="$(curl -s "$(curl -s "https://api.github.com/repos/shadps4-emu/shadps4-qtlauncher/releases" | jq -r '.[] | select(.prerelease == true) | .url')" | awk -F'"' '/browser_download_url.*shadPS4QtLauncher-linux-qt.*zip/ {print $4}')"
_date="$(echo $_url | awk -F '[-/]' -v OFS="-" '{print $11,$12,$13}')"
_pkgver="$(echo $_url | awk -F '[-/]' '{print $14}')"
_commit="$(echo $_url | awk -F '[-/]' '{print $21}' | sed 's/\.zip$//')"
pkgver="$(echo $_url | awk -F '[-/]' -v OFS="" '{print $11,$12,$13,".",$21}' | sed 's/\.zip$//')"
pkgrel=1
pkgdesc="The official Qt launcher for shadps4 emulator (Pre-release version)"
arch=('x86_64')
url="https://github.com/shadps4-emu/shadps4-qtlauncher"
license=('GPL-2.0-only')
makedepends=('yq')
provides=("${pkgname%-pre-release-bin}")
conflicts=("${pkgname%-pre-release-bin}")
options=('!strip')
_appimage=shadPS4QtLauncher-qt.AppImage
source=("https://github.com/shadps4-emu/shadps4-qtlauncher/releases/download/shadPS4QtLauncher-${_date}-${_pkgver}/shadPS4QtLauncher-linux-qt-${_date}-${_commit}.zip")
sha256sums=('SKIP')

prepare() {
    # extract appimage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

    # update script, desktop file and binary name
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
    sed -i "s|Exec=shadPS4QtLauncher|Exec=${pkgname%-pre-release-bin}|" "$srcdir/squashfs-root/${_pkgid}.desktop"
    mv "$srcdir/squashfs-root/usr/bin/${_pkgname}" "$srcdir/squashfs-root/usr/bin/${pkgname%-pre-release-bin}"
}

package() {
    # main files
    install -dm755 "$pkgdir/opt/${_pkgname}"
    mv "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}"

    # script
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/${pkgname%-pre-release-bin}"

    # icon
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.svg" -t "$pkgdir/usr/share/pixmaps"

    # launcher
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.desktop" -t "$pkgdir/usr/share/applications"

    # permissions
    chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}