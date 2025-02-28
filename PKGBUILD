# Maintainer: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.10.0
pkgrel=1
pkgdesc="A GUI client supporting Xray core, sing-box core and other cores"
arch=('x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('dotnet-runtime-8.0' 'xray' 'sing-box' 'git')
makedepends=('dotnet-sdk-8.0')
source=("git+${url}#tag=${pkgver}"
        "${pkgname}.install"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('90b7ab583aa797ea5ea073590668f9b661dd732e110f8abd53fc92b1fc201b40'
            'a99db9b70fe1f3def2d876ffb8f2ee6848ed99e912c5f3a5db40c95c49ce2790'
            '2165a508c1410b92b0f1cb3fae17302859440897b54583f6c9fd42fdf069fbb5'
            'f68ccb83fb112e3e745efbbd9dbcfe50c4611c9cdb470854934a33ec2cd561f2')
conflicts=('v2rayn-bin')
install=${pkgname}.install
options=('!strip')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    dotnet publish ./v2rayN.Desktop/v2rayN.Desktop.csproj \
        -p:DebugType=None \
        --configuration Release \
        --no-self-contained \
        --output output
}

package() {
    mkdir -pv "${pkgdir}/opt/${_pkgname}"
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    cp -r output/* "${pkgdir}/opt/${_pkgname}"
    install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/v2rayn"
    install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/v2rayN.desktop"
    install -Dvm644 "v2rayN.Desktop/v2rayN.png" "$pkgdir/usr/share/pixmaps/v2rayN.png"
    install -Dvm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Create symlink
    mkdir -pv "${pkgdir}/opt/${_pkgname}/bin"/{mihomo,xray,sing_box}
    for bin in mihomo xray sing-box; do
        ln -sv "../../../../usr/bin/${bin}" "${pkgdir}/opt/${_pkgname}/bin/${bin//-/_}/${bin}"
    done
}
