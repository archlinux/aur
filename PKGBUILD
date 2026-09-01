# Maintainer:

pkgname=pattn
_name=PattN
pkgver=7.24.9.P11
pkgrel=1
pkgdesc="A GUI client for Windows, Linux and macOS, support Xray and sing-box and others"
arch=('x86_64')
url="https://github.com/patterniha/PattN"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime=10.0' 'fontconfig' 'glibc' 'libgcc' 'libstdc++' 'xray')
makedepends=('dotnet-sdk=10.0' 'gendesk' 'git')
source=("git+${url}#tag=${pkgver//.P/-P}"
        "git+https://github.com/2dust/GlobalHotKeys.git"
        "https://github.com/MetaCubeX/meta-rules-dat/releases/latest/download/geoip.metadb"
        "https://github.com/Loyalsoldier/geoip/releases/latest/download/Country.mmdb"
        "https://github.com/Loyalsoldier/geoip/releases/latest/download/geoip-only-cn-private.dat"
        "https://github.com/Chocolate4U/Iran-v2ray-rules/releases/latest/download/geoip.dat"
        "https://github.com/Chocolate4U/Iran-v2ray-rules/releases/latest/download/geosite.dat"
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
        "https://github.com/2dust/sing-box-rules/raw/rule-set-geosite/geosite-private.srs"
        "https://github.com/Chocolate4U/Iran-sing-box-rules/raw/rule-set/geoip-ir.srs"
        "https://github.com/Chocolate4U/Iran-sing-box-rules/raw/rule-set/geosite-ir.srs"
        "${pkgname}.sh")
sha256sums=('e7ff66640568550358e0d030b7cc6cd0d52e27709423be86c91fe7467b5241e4'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'cb4f85e20ee206214cd93309f2574ae26ef2748a4b4ff54f737238d639deba5c')

prepare() {
    cd "${_name}"
    git submodule init
    git config submodule.v2rayN/GlobalHotKeys.url "${srcdir}/GlobalHotKeys"
    git -c protocol.file.allow=always submodule update

    cd "v2rayN"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_name}" \
        --icon "${_name}" \
        --categories 'Network'
}

build() {
    cd "${_name}/v2rayN"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:PublishSingleFile=false
        -p:SelfContained=false
        -p:Version=${pkgver//.P/-P}
    )
    dotnet publish "${publish_args[@]}" v2rayN.Desktop/v2rayN.Desktop.csproj
}

package() {
    cd "${_name}/v2rayN"
    install -d "${pkgdir}/usr/lib"
    cp -r build "${pkgdir}/usr/lib/${_name}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 v2rayN.Desktop/v2rayN.png "${pkgdir}/usr/share/pixmaps/${_name}.png"

    # Create symlink
    install -d "${pkgdir}/usr/lib/${_name}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_name}/bin/xray"

    # Install geofiles
    install -Dm644 "${srcdir}/"*.{dat,metadb,mmdb} -t "${pkgdir}/usr/lib/${_name}/bin"
    install -Dm644 "${srcdir}/"*.srs -t "${pkgdir}/usr/lib/${_name}/bin/srss"
}
