# Maintainer: Raphaël Plassart <raphael.plassart@gmail.com>
# https://github.com/QoreDB/QoreDB

pkgname=qoredb-bin
_pkgname=qoredb
pkgver=0.1.22
pkgrel=3
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

_deb="QoreDB_${pkgver}_amd64.deb"
source=("${_deb}::${url}/releases/download/v${pkgver}/QoreDB_${pkgver}_amd64.deb")
sha256sums=('SKIP')

noextract=("${_deb}")

prepare() {
    mkdir -p "${srcdir}/deb"
    ar x "${_deb}" --output="${srcdir}/deb"
    tar -xf "${srcdir}/deb/data.tar."* -C "${srcdir}/deb"
}

package() {
    # Install binary
    install -Dm755 "${srcdir}/deb/usr/bin/qoredb" \
        "${pkgdir}/usr/bin/qoredb"

    # Install shared libraries bundled by Tauri
    if [ -d "${srcdir}/deb/usr/lib" ]; then
        cp -a "${srcdir}/deb/usr/lib" "${pkgdir}/usr/lib"
    fi

    # Install desktop file
    install -Dm644 "${srcdir}/deb/usr/share/applications/"*.desktop \
        "${pkgdir}/usr/share/applications/qoredb.desktop"

    # Install icons
    if [ -d "${srcdir}/deb/usr/share/icons" ]; then
        cp -a "${srcdir}/deb/usr/share/icons" "${pkgdir}/usr/share/icons"
    fi

    # Install license
    install -Dm644 "${srcdir}/deb/usr/share/doc/"*"/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
