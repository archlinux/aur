# Maintainer: colegeming <colegeming@outlook.com>

pkgname=dbx-desktop-bin
pkgver=0.6.70
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
source_x86_64=("DBX_${pkgver}_amd64.deb::https://github.com/t8y2/dbx/releases/download/v0.6.70/DBX_0.6.70_amd64.deb")
sha256sums_x86_64=('1d69f84b3fdbee2746d9d8833795f6d4f2448cdee0e14245317c714849802fd0')
source_aarch64=("DBX_${pkgver}_arm64.deb::https://github.com/t8y2/dbx/releases/download/v0.6.70/DBX_0.6.70_arm64.deb")
sha256sums_aarch64=('abe6a62f7e4df14b4504c3dda6f21c7a278893c679340e6af015f74fa3d52c74')

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