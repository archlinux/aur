# Maintainer: liyp <my at liyp dot cc>

pkgname=cinetry-bin
pkgver=0.7.11
_pkgbuild=40
pkgrel=1
pkgdesc="Cross-platform local media player client for Emby/Jellyfin/WebDAV/IPTV and more"
arch=('x86_64')
url="https://github.com/gstory0404/Cinetry"
license=('custom')
depends=(
    'gtk3'
    'mpv'
    'libpulse'
    'libepoxy'
    'libayatana-appindicator')
provides=('cinetry')
conflicts=('cinetry')

source=(
  "${pkgname}-${pkgver}.deb::https://github.com/gstory0404/Cinetry/releases/download/${pkgver}/Cinetry_${pkgver}+${_pkgbuild}_linux.deb"

)
sha256sums=(
  'd1c15f35117d3a7d69f83f100a1fd3f2155244837b24c50150daf8894973b6af'
)

prepare() {
    bsdtar -xpf data.tar.zst
}

package() {

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    cp -dr --no-preserve=ownership opt "${pkgdir}/"
    cp -dr --no-preserve=ownership usr "${pkgdir}/"



    ln -s "/usr/lib/libmpv.so.2" "${pkgdir}/opt/cinetry/lib/libmpv.so.1"

    cat > "${pkgdir}/usr/bin/cinetry" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/opt/cinetry/lib:${LD_LIBRARY_PATH}"
exec /opt/cinetry/cinetry "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/cinetry"

    mv "${pkgdir}/usr/share/icons/logo.png" "${pkgdir}/usr/share/pixmaps/cinetry.png"

    # 清理掉原包不规范的 icons 目录
    rm -rf "${pkgdir}/usr/share/icons"

    # 修复 .desktop 文件
    sed -i 's|Icon=/usr/share/icons/logo.png|Icon=cinetry|g' "${pkgdir}/usr/share/applications/"*.desktop
    sed -i 's|Exec=/opt/cinetry/cinetry|Exec=cinetry|g' "${pkgdir}/usr/share/applications/"*.desktop
}
