# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.22.3
_bin_commit=bb3aa9a474311e859852d030ab67d9dac6de6fbe
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
        "${pkgname}-bin-${_bin_commit}.zip::${url}-core-bin/raw/${_bin_commit}/v2rayN-linux-64.zip"
        "${pkgname}.sh")
sha256sums=('9f06068798c2d9c9ce20f747374410be4965d84e54381a44678593b7009799b4'
            'SKIP'
            '75bd29260157e9da0aa0db1ed8bba7ab20118a3702eb490cad579b0085b04c5b'
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
    mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
    cp -r build/* "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 v2rayN.Desktop/v2rayN.png -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Create symlink
    mkdir -p "${pkgdir}/usr/lib/${_pkgname}/bin/xray"
    ln -s /usr/bin/xray -t "${pkgdir}/usr/lib/${_pkgname}/bin/xray"

    # Install geofiles
    cp -r "${srcdir}/v2rayN-linux-64/bin/"{srss,*.dat,*db} "${pkgdir}/usr/lib/${_pkgname}/bin"
}
