# Maintainer: sunkhan
pkgname=decibell
pkgver=0.3.8
pkgrel=1
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
    'pipewire'
    'libpipewire'
    'dbus'
    'gtk3'
)
provides=('decibell')
conflicts=('decibell-bin' 'decibell-git')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/sunkhan/decibell/releases/download/v${pkgver}/Decibell_${pkgver}_amd64.AppImage"
    "decibell.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Remove bundled audio libs that conflict with host PipeWire/ALSA stack
    cd "${srcdir}/squashfs-root/usr/lib"
    rm -f libpulse*.so* libpipewire*.so* libasyncns*.so*
}

package() {
    # Install extracted app to /opt preserving original layout
    install -d "${pkgdir}/opt/decibell"
    cp -a "${srcdir}/squashfs-root/usr" "${pkgdir}/opt/decibell/"
    cp -a "${srcdir}/squashfs-root/AppRun" "${pkgdir}/opt/decibell/" 2>/dev/null || true
    cp -a "${srcdir}/squashfs-root/AppRun.wrapped" "${pkgdir}/opt/decibell/" 2>/dev/null || true
    cp -a "${srcdir}/squashfs-root/apprun-hooks" "${pkgdir}/opt/decibell/" 2>/dev/null || true

    # Symlink lib at top level (binary uses relative path ././lib/...)
    ln -s usr/lib "${pkgdir}/opt/decibell/lib"

    # Launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/decibell" << 'LAUNCHER'
#!/bin/sh
export APPDIR="/opt/decibell"
export LD_LIBRARY_PATH="/opt/decibell/usr/lib:/opt/decibell/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
export GDK_PIXBUF_MODULE_FILE="/opt/decibell/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache"
export GSETTINGS_SCHEMA_DIR="/opt/decibell/usr/share/glib-2.0/schemas:${GSETTINGS_SCHEMA_DIR}"
export GDK_BACKEND=x11
cd /opt/decibell
exec /opt/decibell/usr/bin/decibell "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/decibell"

    # Desktop entry
    install -Dm644 "${srcdir}/decibell.desktop" \
        "${pkgdir}/usr/share/applications/decibell.desktop"

    # Icons
    cd "${srcdir}/squashfs-root"
    for icon in usr/share/icons/hicolor/*/apps/decibell.png; do
        size_dir="$(echo "$icon" | grep -oP 'hicolor/\K[^/]+')"
        install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/decibell.png"
    done
}
