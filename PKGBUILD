# Maintainer: Raphaël Plassart <raphael.plassart@gmail.com>
# https://github.com/QoreDB/QoreDB

pkgname=qoredb-bin
_pkgname=qoredb
pkgver=0.1.22
pkgrel=2
pkgdesc="Next gen database client — lightweight alternative to DBeaver/pgAdmin (binary release)"
arch=('x86_64')
url="https://github.com/QoreDB/QoreDB"
license=('Apache-2.0')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup'
    'openssl'
    'pango'
    'webkit2gtk'
)
optdepends=(
    'postgresql-libs: PostgreSQL connection support'
    'libmysqlclient: MySQL connection support'
    'sqlite: SQLite connection support'
    'openssh: SSH tunnel support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')

_appimage="QoreDB_${pkgver}_amd64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/QoreDB_${pkgver}_amd64.AppImage")
sha256sums=('SKIP')

noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    # Install the full squashfs-root as-is to preserve internal paths
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

    # Create launcher script that runs from the correct directory
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/qoredb" <<'LAUNCHER'
#!/bin/bash
cd /opt/qoredb
exec ./AppRun "$@"
LAUNCHER

    # Install desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/"*.desktop \
        "${pkgdir}/usr/share/applications/qoredb.desktop"
    sed -i "s|Exec=.*|Exec=/usr/bin/qoredb %U|g" \
        "${pkgdir}/usr/share/applications/qoredb.desktop"
    sed -i "s|Icon=.*|Icon=qoredb|g" \
        "${pkgdir}/usr/share/applications/qoredb.desktop"

    # Install icons
    for size in 32x32 64x64 128x128 256x256 512x512; do
        icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/"*.png
        if [ -f ${icon} ]; then
            install -Dm644 ${icon} \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/qoredb.png"
        fi
    done

    # Install license
    install -Dm644 "${srcdir}/squashfs-root/usr/share/doc/"*"/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
