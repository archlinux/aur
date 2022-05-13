# Maintainer: msojocs <jiyecafe@gmail.com>

_hf_ver="1.1.1"
_hf_url="https://client.hikarifield.co.jp/release/HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip"
_hf_sha265="b98f2aec774559d20f71da5bd3ac2dfaddd955df6947b44dc3500d4a52e5b86d"

pkgname=hikari-field-client-bin
pkgver="${_hf_ver}"  # 主版本号
pkgrel=1   # 修订版本号release
epoch=1    # 大版本迭代强制更新（维护者变更，尽量不用）
pkgdesc="Hikari Field Client For Linux. "

arch=("any")

url="https://store.hikarifield.co.jp/client"
license=('unknown')

depends=('electron13')
makedepends=('asar' 'p7zip')
source=(
    "HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip::${_hf_url}"
    "hikari-field-client.desktop"
    "hikari-field-client.svg"
    "hikari-field-client"
)
sha256sums=('b98f2aec774559d20f71da5bd3ac2dfaddd955df6947b44dc3500d4a52e5b86d'
            '2b556b725ae33587fc5ac1d53f1ab586b5f9c089dd765d9875e0c6c3971a4f55'
            '3a574b7d3bcfe2e4fbaacfd16a3b43dafae7decbc2f0030c56104cfbbbf75c7e'
            'b8a71c44ec6dc48b00e0f53fc9482b449464e98dd87d5a3218fba01a9336ffbe')
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
    install -Dm644 "${srcdir}/tmp/hf/resources/app.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
}
