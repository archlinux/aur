# Maintainer: Ackerman
pkgname=rootapp-bin
pkgver=0.9.155
pkgrel=2
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('custom')
# Runtime set re-derived from the 0.9.155 AppImage itself (2026-10-27 full
# teardown: sha256 matches the pin, 483 files, 18 ELFs, ASCII + UTF-16 string
# scans of every file - UTF-16 matters because Root is a .NET binary and its
# DllImport probe table is stored that way). It mirrors the RPM/DEB recipes
# for the same payload in opensuse-nexus/rootapp:
#   * DT_NEEDED union of every shipped ELF (readelf -d), minus glibc and the
#     bundled-JRE-only libjawt;
#   * + the libraries loaded by name at runtime (Chromium's dlopen list and
#     Root's .NET probe table): wayland, GL/EGL, Pulse + PipeWire, the X11
#     extras, OpenSSL/Kerberos, VA-API.
# Every name below was resolved against the live Arch core+extra file lists
# (2026-10-27) - that check is why atk/at-spi2-atk, cups-libs and
# pipewire-libs do not appear: Arch merged ATK into at-spi2-core and ships
# libcups/libpipewire as their own packages now. Not required, each verified
# against this payload rather than assumed: wl-clipboard (zero references
# ASCII or UTF-16, clipboard is in-process), libvlc (LibVLCSharp P/Invoke
# declarations only), speechd/GTK4/CUDA providers (optional probes that fall
# back), fuse2 (the AppImage is extracted in prepare() and never executed as
# an AppImage - the runtime has no hard DT_NEEDED on libfuse, only an optional
# dlopen probe, and /usr/bin/rootapp execs AppRun from /opt after install).
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'gtk3'
         'hicolor-icon-theme'
         'krb5'
         'libcups'
         'libglvnd'
         'libice'
         'libpipewire'
         'libpulse'
         'libsm'
         'libva'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxt'
         'libxtst'
         'mesa'
         'nspr'
         'nss'
         'openssl'
         'pango'
         'systemd-libs'
         'vulkan-icd-loader'
         'wayland'
         'xdg-utils')
provides=('rootapp')
conflicts=('rootapp')
options=('!strip')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
sha256sums=('306824e30d41334a7fa569b5d7e08837e5d0e7110b48eb214c987bfe2fea34a1')

prepare() {
    chmod +x "${srcdir}/Root-${pkgver}-x86_64.AppImage"
    "${srcdir}/Root-${pkgver}-x86_64.AppImage" --appimage-extract
    chmod go-w squashfs-root
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"

    # Root.dbg is the split debug companion of usr/bin/Root: same GNU build-id
    # (d66170ab62b2f9a92ae918223266c3c6195fbd53), referenced only by Root's
    # own .gnu_debuglink section - pure DWARF, never loaded at runtime. It is
    # 352 MB of a 1.4 GB payload; the RPM/DEB recipes drop it too.
    rm -f "${pkgdir}/opt/${pkgname}/usr/bin/Root.dbg"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/rootapp" <<'WRAPPER_EOF'
#!/bin/sh
export APPDIR="/opt/rootapp-bin"
exec /opt/rootapp-bin/AppRun "$@"
WRAPPER_EOF
    chmod 755 "${pkgdir}/usr/bin/rootapp"

    # Upstream Root.png is 512x512 (verified by IHDR, 2026-10-27): install it
    # into the matching hicolor size class, not 256x256 as before.
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootapp.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rootapp.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rootapp.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=rootapp %U
Icon=rootapp
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/rootapp;
EOF
}
