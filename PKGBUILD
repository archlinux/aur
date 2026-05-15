pkgname=shamela-native
pkgver=1447.11
pkgrel=2
pkgdesc="Al-Maktaba Al-Shamela — Arabic and Islamic digital library"
arch=('x86_64')
url="https://shamela.ws"
license=('LicenseRef-shamela')
depends=(
    'fuse2'
    'libselinux'
    'libxcrypt-compat'
    'python'
)
makedepends=(
    'squashfs-tools'
)
conflicts=('shamela' 'shamela-bin')
options=('!strip')
source=(
    "shamela.py"
    "shamela-linux-${pkgver}.tar.xz::https://archive.org/download/shamela_download/shamela-linux-${pkgver}.tar.xz"
)
sha1sums=(
    'SKIP'
    'cbe0e8282bd8470b1a30c8bb55be9fc205b8f394'
)

prepare() {
    cd "${srcdir}/shamela"

    # ── Extract squashfs from the AppImage (requires FUSE) ────────────────
    # AppImage extraction uses the built-in --appimage-extract mechanism
    chmod +x shamela.AppImage
    ./shamela.AppImage --appimage-extract

    sed -i '/^Exec=/c\Exec=/usr/bin/shamela' squashfs-root/shamela.desktop
}

package() {
    # ── Upstream tarball seed (/opt) ─────────────────────────────────────
    # Store the upstream tar.xz as-is for first-run seeding by /usr/bin/shamela
    install -d "${pkgdir}/opt/shamela"
    install -Dm644 "${srcdir}/shamela-linux-${pkgver}.tar.xz" \
        "${pkgdir}/opt/shamela/shamela.tar.xz"

    # ── Wrapper / lifecycle manager (/usr/bin) ─────────────────────────────
    install -Dm755 shamela.py \
        "${pkgdir}/usr/bin/shamela"

    # ── System .desktop entry (/usr/share/applications) ───────────────────
    # The app's own shortcut generation is suppressed at first seed via a
    # settings db patch (shortcut_desktop=false, shortcut_start=false in
    # database/user/data.db), making this the permanent and only .desktop
    install -Dm644 "${srcdir}/shamela/squashfs-root/shamela.desktop" \
        "${pkgdir}/usr/share/applications/shamela.desktop"

    # System icon (96×96 RGBA PNG, extracted from AppImage squashfs)
    # Referenced as Icon=shamela in the .desktop file
    install -Dm644 \
        "${srcdir}/shamela/squashfs-root/usr/share/icons/hicolor/96x96/apps/shamela.png" \
        "${pkgdir}/usr/share/icons/hicolor/96x96/apps/shamela.png"

    # ── Licenses ───────────────────────────────────────────────────────────
    install -Dm644 \
        shamela/app/linux/64/jre/2/legal/java.base/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 \
        shamela/app/linux/64/jre/2/legal/java.base/ADDITIONAL_LICENSE_INFO \
        "${pkgdir}/usr/share/licenses/${pkgname}/ADDITIONAL_LICENSE_INFO"
}
