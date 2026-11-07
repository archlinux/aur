# Maintainer: VisorCraft <thomas@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: GPL-3.0-only
#
# Binary package. The desktop build is a jlink AppImage, so AUR users
# install the public GitHub release rather than compiling Compose.
# Playback still needs host libvlc; the AppImage does not bundle it.

pkgname=radioshed
pkgver=1.10.1
pkgrel=1
pkgdesc="Station-centric player for a local music library"
arch=(x86_64)
url="https://www.visorcraft.com/"
license=(GPL-3.0-only)
depends=(
    fuse2
    hicolor-icon-theme
    libvlc
    vlc-plugins-base
)
makedepends=(squashfs-tools)
options=(!strip)
source=(LICENSE)
source_x86_64=(
    "$pkgname-$pkgver.AppImage::https://github.com/visorcraft/RadioShed/releases/download/v$pkgver/RadioShed-$pkgver-x86_64.AppImage"
)
sha256sums=('f1099d46419c109bc8ad60dfe24a81c90b4d61f76747c7255fb599dd6f608832')
sha256sums_x86_64=('0f03a8ea4fc342bdfb37d4ceab2d61e994f392297664e732d75efe715ea7c41f')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    # The ELF runtime contains an earlier "hsqs" byte sequence that is not the
    # appended filesystem. The runtime reports the real squashfs offset.
    local offset
    offset="$("./$pkgname-$pkgver.AppImage" --appimage-offset)"
    if [[ ! "$offset" =~ ^[0-9]+$ ]]; then
        echo "Could not read the AppImage squashfs offset." >&2
        return 1
    fi
    unsquashfs -q -o "$offset" -d squashfs-root "$pkgname-$pkgver.AppImage"
}

package() {
    install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/opt/radioshed/RadioShed.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/radioshed/RadioShed.AppImage "$pkgdir/usr/bin/radioshed"

    install -Dm644 squashfs-root/radioshed.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/radioshed.png"
    sed -e 's|^Exec=.*|Exec=radioshed|' squashfs-root/radioshed.desktop \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/radioshed.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
