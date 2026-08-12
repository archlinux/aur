# Creator: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: italoghost <eduprodive at posteo dot me>
# Maintainer: Kaleb
pkgname=rpcs3-bin
_pkgname=rpcs3
pkgver=0.0.42.19734
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator (Latest Binary)'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL-2.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!zipman' '!emptydirs' '!debug')
depends=(
    'glibc'
    'libgcc'
    'zlib'
    'bash'
    'libx11'
    'libxcb'
    'vulkan-icd-loader'
    'libglvnd'
    'alsa-lib'
    'fontconfig'
    'freetype2'
    'e2fsprogs'
    'libstdc++'
    'gmp'
    'libdrm'
    'libgpg-error'
)
optdepends=('wayland')
makedepends=('curl' 'jq')

# Source the GitHub API to trigger the build, the actual AppImage is fetched in prepare()
source=("${_pkgname}::https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest")
sha256sums=('SKIP')

pkgver() {
    # Cleanly fetch the latest tag name from GitHub API and format it
    curl -s "https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest" | \
    jq -r '(.name | gsub("-"; "."))'
}

prepare() {
    # Dynamically find the download URL for the AppImage asset
    _appimage_url=$(curl -s "https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest" | \
                    awk -F'"' '/browser_download_url.*rpcs3.*AppImage/ {print $4}')
    msg2 "Downloading the actual AppImage..."
    curl -L "$_appimage_url" -o "${srcdir}/rpcs3.AppImage"
    chmod +x "${srcdir}/rpcs3.AppImage"
}

build() {
    cd "${srcdir}"
    # Extracting AppImage content into squashfs-root
    ./rpcs3.AppImage --appimage-extract
    # Patch AppRun to point to the fixed installation directory in /opt
    sed -i "s|this_dir=\"\$(readlink -f \"\$(dirname \"\$0\")\")\"|this_dir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
    # Core directories
    install -dm755 "$pkgdir/opt/${_pkgname}"
    cp -rp "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}/"
    # Symlink the launcher to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/${_pkgname}"
    # Install Icon, Desktop and Metainfo
    install -Dm644 "$srcdir/squashfs-root/${_pkgname}.svg" "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
    install -Dm644 "$srcdir/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "$srcdir/squashfs-root/usr/share/metainfo/${_pkgname}.metainfo.xml" "$pkgdir/usr/share/metainfo/${_pkgname}.metainfo.xml"
    # Permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
