# Maintainer: czyt <czytcn@gmail.com>
pkgname=nowledge-mem-bin
pkgver=0.10.62
pkgrel=1
pkgdesc="你的智能体、AI 助手、代码工具，共享一套记忆"
arch=('x86_64')
url="https://mem.nowledge.co"
license=('Proprietary')
options=(!debug !strip)
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('gnome-keyring: for credential storage'
            'xdg-utils: for opening links and nowledgemem:// URLs')
provides=("nowledge-mem=${pkgver}" "nmem-cli=${pkgver}")
conflicts=('nowledge-mem' 'nmem-cli')
source_x86_64=("nowledge-mem-${pkgver}.deb::https://download-mem.nowledge.co/app/${pkgver}/x86_64-unknown-linux-gnu.deb")
sha256sums_x86_64=('9366ba745139c49139c80e3078fd2c55e6434c7b7effb75821d0c11745aa846d')

package() {
    local _debfile="nowledge-mem-${pkgver}.deb"
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"

    # The Rust backend is bundled beside the GUI resources. Keep the real GUI
    # there and use a launcher to tell Tauri exactly where nmem-server lives.
    mv "${pkgdir}/usr/bin/nowledge-mem" \
       "${pkgdir}/usr/lib/Nowledge Mem/nowledge-mem"
    cat > "${pkgdir}/usr/bin/nowledge-mem" << 'EOF'
#!/bin/sh
export NMEM_SERVER_BIN="/usr/lib/Nowledge Mem/_up_/rust-backend/nmem-server"
exec "/usr/lib/Nowledge Mem/nowledge-mem" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/nowledge-mem"

    # Expose the native Rust CLIs shipped by upstream.
    ln -s "/usr/lib/Nowledge Mem/_up_/rust-backend/nmem" \
          "${pkgdir}/usr/bin/nmem"
    ln -s "/usr/lib/Nowledge Mem/_up_/rust-backend/browse-now" \
          "${pkgdir}/usr/bin/browse-now"
}
