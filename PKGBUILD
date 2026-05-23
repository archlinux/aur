# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.22.2
_bin_commit=61f39cfd2db3fed41eddd899a3b63fb1946f8c33
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
sha256sums=('a77c8ad1e09e0572b9ffc8b6b6bbda125823d512fde45bf69e0a22129ceeed49'
            'SKIP'
            '00dafbbcd6a013c97dfff03a95fb1414481b6eb18ad65cfe64247172859a1a9a'
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
    dotnet publish \
        --configuration Release \
        --output build \
        --runtime linux-x64 \
        -p:SelfContained=false \
        v2rayN.Desktop/v2rayN.Desktop.csproj
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
