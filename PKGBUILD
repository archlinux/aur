# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: NourEddineX
# Contributor: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.24.4
_commit=6f26706c8083a905645e7c959383edb4836ee0fa
pkgrel=1
pkgdesc="A GUI client for Windows, Linux and macOS, support Xray and sing-box and others"
arch=('aarch64' 'x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime-10.0' 'fontconfig' 'glibc' 'libgcc' 'libstdc++' 'xray')
makedepends=('dotnet-sdk-10.0' 'gendesk' 'git')
options=('!strip')
install="${pkgname}.install"
source=("git+${url}#tag=${pkgver}"
        "git+https://github.com/2dust/GlobalHotKeys.git"
        "${pkgname}-bin-${_commit}.zip::${url}-core-bin/raw/${_commit}/v2rayN-linux-64.zip"
        "${pkgname}.sh")
sha256sums=('5e09fdd6b9fdd7931997d45c7f047bd5ab3d1e622031812c5c5f395a693d28d8'
            'SKIP'
            'aea5b7a847c8713e10f7ad1c82eef0134d38a3ee0ed09e9bee4ca50bfb04e7ea'
            '0fd5ed368fc6f51f6a8d2507c7cf598edbede076245d5661b06fe4394a6f1390')

prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.v2rayN/GlobalHotKeys.url "${srcdir}/GlobalHotKeys"
    git -c protocol.file.allow=always submodule update

    cd "${_pkgname}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_pkgname}" \
        --icon "${_pkgname}" \
        --categories 'Network'
}

build() {
    cd "${_pkgname}/${_pkgname}"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:SelfContained=false
    )
    dotnet publish "${publish_args[@]}" v2rayN.Desktop/v2rayN.Desktop.csproj
}

package() {
    cd "${_pkgname}/${_pkgname}"
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -r build/* "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 v2rayN.Desktop/v2rayN.png -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Create symlink
    install -d "${pkgdir}/usr/lib/${_pkgname}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_pkgname}/bin/xray"

    # Install geofiles
    cp -r "${srcdir}/v2rayN-linux-64/bin/"{srss,*.dat,*db} "${pkgdir}/usr/lib/${_pkgname}/bin"
}
