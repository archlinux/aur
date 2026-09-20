# Maintainer:

pkgname=pattn
_name=PattN
pkgver=7.25.2.P28
pkgrel=1
pkgdesc="A GUI client for Windows, Linux and macOS, support Xray and sing-box and others"
arch=('x86_64')
url="https://github.com/patterniha/PattN"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime=10.0' 'fontconfig' 'glibc' 'libgcc' 'libstdc++' 'xray')
makedepends=('dotnet-sdk=10.0' 'gendesk' 'git')
source=("git+${url}#tag=${pkgver//.P/-P}"
        "git+https://github.com/2dust/GlobalHotKeys.git"
        "git+https://github.com/Chocolate4U/Iran-sing-box-rules.git#branch=rule-set"
        "git+https://github.com/Chocolate4U/Iran-v2ray-rules.git#branch=release"
        "git+https://github.com/Loyalsoldier/geoip.git#branch=release"
        "git+https://github.com/MetaCubeX/meta-rules-dat.git#branch=release"
        "sing-box-rules-geoip::git+https://github.com/2dust/sing-box-rules.git#branch=rule-set-geoip"
        "sing-box-rules-geosite::git+https://github.com/2dust/sing-box-rules.git#branch=rule-set-geosite"
        "${pkgname}.sh")
sha256sums=('d208e20bbb81e61a5df4de8e25bbf3f35d365223cf312739802d7103e044a973'
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

    install -d "${pkgdir}/usr/lib/${_name}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_name}/bin/xray"

    for file in geoip geosite; do
        install -Dm644 "${srcdir}/Iran-v2ray-rules/${file}.dat" -t "${pkgdir}/usr/lib/${_name}/bin"
        install -Dm644 "${srcdir}/Iran-sing-box-rules/${file}-ir.srs" -t "${pkgdir}/usr/lib/${_name}/bin/srss"
    done
    install -Dm644 "${srcdir}/meta-rules-dat/geoip.metadb" -t "${pkgdir}/usr/lib/${_name}/bin"
    for file in Country.mmdb geoip-only-cn-private.dat; do
        install -Dm644 "${srcdir}/geoip/${file}" -t "${pkgdir}/usr/lib/${_name}/bin"
    done
    for file in cn facebook fastly google netflix private telegram twitter; do
        install -Dm644 "${srcdir}/sing-box-rules-geoip/geoip-${file}.srs" -t "${pkgdir}/usr/lib/${_name}/bin/srss"
    done
    for file in category-ads-all cn geolocation-cn gfw google greatfire private; do
        install -Dm644 "${srcdir}/sing-box-rules-geosite/geosite-${file}.srs" -t "${pkgdir}/usr/lib/${_name}/bin/srss"
    done
}
