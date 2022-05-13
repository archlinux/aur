# Maintainer: msojocs <jiyecafe@gmail.com>

_hf_ver="1.1.1"
_hf_url="https://client.hikarifield.co.jp/release/HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip"
_hf_md5="62486f9270ead23f2bbbe20a1dcd524d"

pkgname=hikari-field-client-bin
pkgver="${_hf_ver}"  # 主版本号
pkgrel=1   # 修订版本号release
epoch=1    # 大版本迭代强制更新（维护者变更，尽量不用）
pkgdesc="Hikari Field Client For Linux. "

arch=("x86_64")

url="https://store.hikarifield.co.jp/client"
license=('unknown')

depends=('electron13')
makedepends=('asar')
source=(
    "HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip::${_hf_url}"
    "hikari-field-client.desktop"
    "hikari-field-client.svg"
    "hikari-field-client"
)
md5sums=(
    "${_hf_md5}"
    "SKIP"          # desktop
    "SKIP"          # svg
    "SKIP"          # hikari-field-client
)
options=('!strip')

prepare(){
    echo "prepare"
    tmp_dir="tmp"
    mkdir -p "$tmp_dir/hf"
    7z x HIKARI-FIELD-CLIENT-Setup-*.exe -o"$tmp_dir/hf" "\$PLUGINSDIR/app-64.7z"
    7z x "$tmp_dir/hf/\$PLUGINSDIR/app-64.7z" -o"$tmp_dir/hf" "resources"
    rm -rf "$tmp_dir/hf/\$PLUGINSDIR/app-64.7z" "$tmp_dir/hf/resources/elevate.exe"
}
build(){
    echo "build"
    cd tmp/hf/resources
    asar e app.asar app
    # !n.app.isPackaged
    sed -i 's#!n.app.isPackaged#n.app.isPackaged#' app/build/main.js
    asar p app app.asar
    rm -rf app
}
package(){
    echo "package"
    install -Dm644 "${srcdir}/hikari-field-client.desktop" "${pkgdir}/usr/share/applications/hikari-field-client.desktop"
    install -Dm644 "${srcdir}/hikari-field-client.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hikari-field-client.svg"
    install -Dm755 "${srcdir}/hikari-field-client" "${pkgdir}/usr/bin/hikari-field-client"
    install -Dm644 "${srcdir}/tmp/hf/resources/app.asar" "${pkgdir}/opt/hikari-field-client/app.asar"
}