# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: NourEddineX
# Contributor: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_name=v2rayN
pkgver=7.25.4
pkgrel=1
pkgdesc="A GUI client for Windows, Linux and macOS, support Xray and sing-box and others"
arch=('aarch64' 'x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime=10.0' 'fontconfig' 'glibc' 'libgcc' 'libstdc++' 'xray')
makedepends=('dotnet-sdk=10.0' 'gendesk' 'git')
install="${pkgname}.install"
source=("git+${url}#tag=${pkgver}"
        "git+https://github.com/2dust/GlobalHotKeys.git"
        "git+https://github.com/Loyalsoldier/geoip.git#branch=release"
        "git+https://github.com/Loyalsoldier/v2ray-rules-dat.git#branch=release"
        "git+https://github.com/MetaCubeX/meta-rules-dat.git#branch=release"
        "sing-box-rules-geoip::git+https://github.com/2dust/sing-box-rules.git#branch=rule-set-geoip"
        "sing-box-rules-geosite::git+https://github.com/2dust/sing-box-rules.git#branch=rule-set-geosite"
        "${pkgname}.sh")
sha256sums=('66b6c6919c39f215017a13b97719a7eda2133b30ba9a294414034e65fa76ab7e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0fd5ed368fc6f51f6a8d2507c7cf598edbede076245d5661b06fe4394a6f1390')

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
        -p:PublishSingleFile=false
        -p:SelfContained=false
    )
    dotnet publish "${publish_args[@]}" v2rayN.Desktop/v2rayN.Desktop.csproj
}

package() {
    cd "${_name}/${_name}"
    install -d "${pkgdir}/usr/lib"
    cp -r build "${pkgdir}/usr/lib/${_name}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 v2rayN.Desktop/v2rayN.png -t "${pkgdir}/usr/share/pixmaps"

    install -d "${pkgdir}/usr/lib/${_name}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_name}/bin/xray"

    for file in geoip geosite; do
        install -Dm644 "${srcdir}/v2ray-rules-dat/${file}.dat" -t "${pkgdir}/usr/lib/${_name}/bin"
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
