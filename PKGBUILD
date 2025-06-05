# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=shadps4-pre-release-bin
_pkgname=shadPS4
_pkgid=net.shadps4.shadPS4
_url="$(curl -s "$(curl -s "https://api.github.com/repos/shadps4-emu/shadPS4/releases" | jq -r '.[] | select(.prerelease == true) | .url')" | awk -F'"' '/browser_download_url.*Pre-release-shadPS4.*linux-qt.*zip/ {print $4}')"
_date="$(echo $_url | awk -F '[-/]' -v OFS="-" '{print $12,$13,$14}')"
_pkgver="$(echo $_url | awk -F '[-/]' '{print $15}')"
_commit="$(echo $_url | awk -F '[-/]' '{print $22}' | sed 's/\.zip$//')"
pkgver="$(echo $_url | awk -F '[-/]' -v OFS="" '{print $12,$13,$14,".",$22}' | sed 's/\.zip$//')"
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator (Pre-release version)"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
makedepends=('yq')
replaces=("${pkgname%-pre-release-bin}")
provides=("${pkgname%-pre-release-bin}")
conflicts=("${pkgname%-pre-release-bin}")
options=('!strip')
_appimage=Shadps4-qt.AppImage
source=("https://github.com/shadps4-emu/shadPS4/releases/download/Pre-release-shadPS4-${_date}-${_pkgver}/shadps4-linux-qt-${_date}-${_commit}.zip")
sha256sums=('SKIP')

prepare() {
    # extract appimage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

    # update script
    sed -i "s|this_dir=\"\$(readlink -f \"\$(dirname \"\$0\")\")\"|this_dir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
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