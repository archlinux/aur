# Maintainer: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.6.1
pkgrel=1
pkgdesc="A GUI client supporting Xray core, sing-box core and other cores"
arch=('x86_64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=('dotnet-runtime-8.0' 'xray' 'sing-box')
makedepends=('dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.install"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('15bbdb29866219e2a365137d5d79b3fabed9f0ff70998720dd51a520b803e940'
            'a99db9b70fe1f3def2d876ffb8f2ee6848ed99e912c5f3a5db40c95c49ce2790'
            '25e24416a4881021f971e8b93e119e0843224c35fd71a2b3a55cbf148d585fba'
            'f68ccb83fb112e3e745efbbd9dbcfe50c4611c9cdb470854934a33ec2cd561f2')
conflicts=('v2rayn-bin')
install=${pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
    dotnet publish ./v2rayN.Desktop/v2rayN.Desktop.csproj \
        -p:DebugType=None \
        --framework net8.0 \
        --configuration Release \
        --use-current-runtime \
        --no-self-contained \
        --output output
}

package() {
    mkdir -pv "${pkgdir}/opt/${_pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
    cp -r output/* "${pkgdir}/opt/${_pkgname}"
    install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/v2rayn"
    install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/v2rayN.desktop"
    install -Dvm644 "v2rayN.Desktop/v2rayN.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/v2rayN.png"
    install -Dvm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
