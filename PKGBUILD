# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: NourEddineX
# Contributor: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_name=v2rayN
pkgver=7.24.8
pkgrel=1
pkgdesc="A GUI client for Windows, Linux and macOS, support Xray and sing-box and others"
arch=('aarch64' 'x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime-10.0' 'fontconfig' 'glibc' 'libgcc' 'libstdc++' 'xray')
makedepends=('dotnet-sdk-10.0' 'gendesk' 'git')
install="${pkgname}.install"
source=("git+${url}#tag=${pkgver}"
        "${pkgname}.sh"
        "git+https://github.com/2dust/GlobalHotKeys.git"
        "https://github.com/MetaCubeX/meta-rules-dat/releases/latest/download/geoip.metadb"
        "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country.mmdb"
        "https://github.com/Loyalsoldier/geoip/releases/latest/download/geoip-only-cn-private.dat"
        "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
        "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-cn.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-facebook.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-fastly.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-google.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-netflix.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-private.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-telegram.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geoip/geoip-twitter.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-category-ads-all.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-cn.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-geolocation-cn.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-gfw.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-google.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-greatfire.srs"
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-private.srs")
sha256sums=('ac1f2a4822e853c275dd4995696724ccc314ba8ac75836c897d5a3625478ad68'
            '0fd5ed368fc6f51f6a8d2507c7cf598edbede076245d5661b06fe4394a6f1390'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${_name}"
    git submodule init
    git config submodule.v2rayN/GlobalHotKeys.url "${srcdir}/GlobalHotKeys"
    git -c protocol.file.allow=always submodule update

    cd "${_name}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name}" \
        --icon "${_name}" \
        --categories 'Network'
}

build() {
    cd "${_name}/${_name}"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:SelfContained=false
    )
    dotnet publish "${publish_args[@]}" v2rayN.Desktop/v2rayN.Desktop.csproj
}

package() {
    cd "${_name}/${_name}"
    install -d "${pkgdir}/usr/lib/${_name}/bin/srss"
    cp -r build/* "${pkgdir}/usr/lib/${_name}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 v2rayN.Desktop/v2rayN.png -t "${pkgdir}/usr/share/pixmaps"

    # Create symlink
    install -d "${pkgdir}/usr/lib/${_name}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_name}/bin/xray"

    # Install geofiles
    cp "${srcdir}/"*.{dat,metadb,mmdb} "${pkgdir}/usr/lib/${_name}/bin"
    cp "${srcdir}/"*.srs "${pkgdir}/usr/lib/${_name}/bin/srss"
}
