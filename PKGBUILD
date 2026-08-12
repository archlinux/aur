# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=shadps4-qtlauncher-pre-release-bin
_pkgname=shadPS4QtLauncher
_pkgid=net.shadps4.shadps4-qtlauncher
pkgver=20260808.a12b988
pkgrel=1
pkgdesc="The official Qt launcher for shadps4 emulator (Pre-release version)"
arch=('x86_64')
url="https://github.com/shadps4-emu/shadps4-qtlauncher"
license=('GPL-2.0-only')
depends=(
    'libx11'
    'libglvnd'
    'libxcb'
    'fontconfig'
    'libdrm'
    'freetype2'
    'glibc'
    'zlib'
    'bash'
    'e2fsprogs'
    'libgpg-error'
    'libgcc'
    'libstdc++'
)
optdepends=('wayland')
makedepends=('curl' 'jq' 'unzip')
provides=('shadps4-qtlauncher')
conflicts=('shadps4-qtlauncher')
options=('!strip' '!zipman' '!emptydirs' '!debug')
source=("${pkgname}::https://api.github.com/repos/shadps4-emu/shadps4-qtlauncher/releases")
sha256sums=('SKIP')

pkgver() {
    # Fetches the latest pre-release tag and formats it for the pkgver variable
    curl -s "https://api.github.com/repos/shadps4-emu/shadps4-qtlauncher/releases" | \
    jq -r '. | map(select(.prerelease == true))[0].assets[0].browser_download_url' | \
    awk -F '[-/]' '{print $11""$12""$13"."$21}' | sed 's/\.zip$//'
}

prepare() {
    # Dynamically find the latest release
    _download_url=$(curl -s "https://api.github.com/repos/shadps4-emu/shadps4-qtlauncher/releases" | \
                    jq -r '. | map(select(.prerelease == true))[0].assets[] | select(.name | contains("linux-qt")) | .browser_download_url')
    msg2 "Downloading AppImage ZIP..."
    curl -L "$_download_url" -o "launcher.zip"
    unzip -o "launcher.zip"
    _appimage=$(ls *.AppImage)
    chmod +x "$_appimage"
    msg2 "Extracting AppImage content..."
    ./"$_appimage" --appimage-extract
}

build() {
    cd "${srcdir}/squashfs-root"
    # Patch AppRun to point to the fixed installation directory in /opt,
    # adjust the Exec and Icon paths in the .desktop,
    # and change the binary name
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
    sed -i "s|Exec=${_pkgname}|Exec=shadps4-qtlauncher|" "${_pkgid}.desktop"
    sed -i "s|Icon=net.shadps4.shadPS4|Icon=shadps4-qtlauncher|" "${_pkgid}.desktop"
    mv "${srcdir}/squashfs-root/usr/bin/${_pkgname}" "${srcdir}/squashfs-root/usr/bin/shadps4-qtlauncher"
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    # Move extracted content to /opt
    cp -ar "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    # Install the .desktop file and the icon
    install -Dm644 "${srcdir}/squashfs-root/${_pkgid}.desktop" "${pkgdir}/usr/share/applications/shadps4-qtlauncher.desktop"
    install -Dm644 "${srcdir}/squashfs-root/net.shadps4.shadPS4.svg" "${pkgdir}/usr/share/pixmaps/shadps4-qtlauncher.svg"
    # Create a symbolic link for the AppRun
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/shadps4-qtlauncher"
    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
