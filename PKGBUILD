# Maintainer: msojocs <jiyecafe@gmail.com>

_hf_ver="1.2.0"
_hf_url="https://client.hikarifield.co.jp/release/HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip"
_hf_sha265="b98f2aec774559d20f71da5bd3ac2dfaddd955df6947b44dc3500d4a52e5b86d"
# _electron_version="13.4.0"

pkgname=hikari-field-client-bin
pkgver="${_hf_ver}"  # 主版本号
pkgrel=1   # 修订版本号release
epoch=1    # 大版本迭代强制更新（维护者变更，尽量不用）
pkgdesc="Hikari Field Client For Linux. "

arch=("any")

url="https://store.hikarifield.co.jp/client"
license=('unknown')

depends=('electron21-bin')
optdepends=('wqy-microhei')

makedepends=('asar' 'p7zip')
source=(
    "HIKARI-FIELD-CLIENT-Setup-${_hf_ver}.zip::${_hf_url}"
    # "electron-${_electron_version}.zip::https://npmmirror.com/mirrors/electron/${_electron_version}/electron-v${_electron_version}-linux-x64.zip"
    "hikari-field-client.desktop"
    "hikari-field-client.svg"
    "hikari-field-client"
    "inject-main.js"
)
sha256sums=('2a11139a35b44e006ece02107358aa675c05e98016665d5b103176be5ffc191d'
            '2b556b725ae33587fc5ac1d53f1ab586b5f9c089dd765d9875e0c6c3971a4f55'
            '3a574b7d3bcfe2e4fbaacfd16a3b43dafae7decbc2f0030c56104cfbbbf75c7e'
            '13d017aa3df22a9588b01e16a41c840ef2b100dffe2c07e41ea5bec12ede7391'
            '2c8d95c7996b7b82dc83d80b198629196349df5437d560f8d2127b33f1545e67')
options=('!strip')

prepare(){
    echo "prepare"
    tmp_dir="tmp"
    mkdir -p "$tmp_dir/hf"
    7z x -y HIKARI-FIELD-CLIENT-Setup-*.exe -o"$tmp_dir/hf" "\$PLUGINSDIR/app-64.7z"
    7z x -y "$tmp_dir/hf/\$PLUGINSDIR/app-64.7z" -o"$tmp_dir/hf" "resources"
    rm -rf "$tmp_dir/hf/\$PLUGINSDIR/app-64.7z" "$tmp_dir/hf/resources/elevate.exe"
}
build(){
    echo "build"
    cd tmp/hf/resources
    # asar e app.asar app

    # cp "$srcdir/inject-main.js" "app/build/temp.js"
    # cat app/build/main.js >> "app/build/temp.js"
    # rm -rf "app/build/main.js"
    # mv "app/build/temp.js" "app/build/main.js"
    # 处理界面在小分辨率下显示不完整的问题
    # sed -i 's#idth:1280,#idth:1000,#g' app/build/main.js
    # sed -i 's#eight:720#eight:500#g' app/build/main.js

    # asar p app app.asar
    rm -rf app
}
package(){
    echo "package"
    install -Dm644 "${srcdir}/hikari-field-client.desktop" "${pkgdir}/usr/share/applications/hikari-field-client.desktop"
    install -Dm644 "${srcdir}/hikari-field-client.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hikari-field-client.svg"
    install -Dm755 "${srcdir}/hikari-field-client" "${pkgdir}/usr/bin/hikari-field-client"
    install -Dm644 "${srcdir}/tmp/hf/resources/app.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
}
