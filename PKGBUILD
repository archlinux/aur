# Maintainer: colegeming <colegeming@outlook.com>

pkgname=dbx-desktop-bin
pkgver=0.6.69
pkgrel=1
pkgdesc='Lightweight cross-platform database client for 100+ databases, with built-in AI and MCP server (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/t8y2/dbx'
license=('Apache-2.0')
# Tauri (Rust) GUI: GTK3 + WebKitGTK 4.1 at runtime. The .deb itself declares
# libwebkit2gtk-4.1-0 / libgtk-3-0 / libappindicator3-1; the Arch equivalents
# are webkit2gtk-4.1, gtk3 and libayatana-appindicator (the maintained fork of
# libappindicator). unixodbc/openssl come from the SQL/ODBC and TLS features
# linked into the binary.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'unixodbc' 'openssl')
provides=('dbx-desktop')
conflicts=('dbx' 'dbx-bin' 'dbx-desktop')
options=('!strip' '!debug')

# The upstream .deb name embeds the version; the local alias is versioned too
# so a stale download from a previous release can never be reused from the
# makepkg/yay cache.
source_x86_64=("DBX_${pkgver}_amd64.deb::https://github.com/t8y2/dbx/releases/download/v0.6.69/DBX_0.6.69_amd64.deb")
sha256sums_x86_64=('c9c407ab3f3b941384a9e5e1748a138b32f6c1b50f226a13cdd650fa9912c095')
source_aarch64=("DBX_${pkgver}_arm64.deb::https://github.com/t8y2/dbx/releases/download/v0.6.69/DBX_0.6.69_arm64.deb")
sha256sums_aarch64=('baff50b7305f1bf4650036a463250cc7860858d4bf48ebaf114e014d2b6946a9')

package() {
    # The .deb payload is exactly: usr/bin/dbx, usr/share/applications/DBX.desktop
    # and usr/share/icons/hicolor/{32x32,128x128,256x256@2}/apps/dbx.png -- so
    # unpacking straight into $pkgdir yields a correct Arch layout.
    local deb
    case "${CARCH}" in
        x86_64)  deb="DBX_${pkgver}_amd64.deb" ;;
        aarch64) deb="DBX_${pkgver}_arm64.deb" ;;
    esac

    # A .deb is an ar(1) archive holding debian-binary, control.tar.* and
    # data.tar.*. Extract the container first, then unpack the data member --
    # bsdtar (libarchive, already required by makepkg) reads ar(1) directly and
    # auto-detects the payload compression (gz/xz/zst), so no binutils needed
    # and nothing breaks if upstream switches compression.
    mkdir -p "${srcdir}/deb-extract"
    bsdtar -xf "${srcdir}/${deb}" -C "${srcdir}/deb-extract"
    bsdtar -xf "${srcdir}/deb-extract"/data.tar.* -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chmod 755 "${pkgdir}/usr/bin/dbx"
}