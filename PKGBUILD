# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=shadps4-pre-release-bin
_pkgname=shadPS4
_pkgid=net.shadps4.shadPS4
pkgver=20260812.23392e1
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator (Pre-release version - SDL)"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
depends=('glibc' 'bash' 'util-linux-libs' 'libstdc++' 'libgcc')
makedepends=('curl' 'jq' 'unzip')
provides=("shadps4")
conflicts=("shadps4")
options=('!strip' '!zipman' '!emptydirs' '!debug')
source=("${pkgname}::https://api.github.com/repos/shadps4-emu/shadPS4/releases")
sha256sums=('SKIP')

pkgver() {
    # Fetches the latest pre-release tag and formats it for the pkgver variable
    curl -s "https://api.github.com/repos/shadps4-emu/shadPS4/releases" | \
    jq -r '. | map(select(.prerelease == true))[0].assets[] | select(.name | contains("linux-sdl")) | .name' | \
    awk -F '[-/]' '{print $4""$5""$6"."$7}' | sed 's/\.zip$//'
}

prepare() {
    # Dynamically find the latest release
    _download_url=$(curl -s "https://api.github.com/repos/shadps4-emu/shadPS4/releases" | \
                    jq -r '. | map(select(.prerelease == true))[0].assets[] | select(.name | contains("linux-sdl")) | .browser_download_url')
    msg2 "Downloading AppImage ZIP..."
    curl -L "$_download_url" -o "shadps4_core.zip"
    unzip -o "shadps4_core.zip"
    _appimage=$(ls *.AppImage)
    chmod +x "$_appimage"
    msg2 "Extracting AppImage content..."
    ./"$_appimage" --appimage-extract
}

build() {
    cd "${srcdir}/squashfs-root"
    # Patch AppRun to point to the fixed installation directory in /opt,
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    # Move extracted content to /opt
    cp -ar "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    # Create a symbolic link for the AppRun
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/shadps4"
    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
