# Maintainer: yidaduizuoye <yidaduizuoye at outlook dot com>

pkgname=v2rayn
_pkgname=v2rayN
pkgver=7.15.4
pkgrel=1
pkgdesc="A GUI client supporting Xray core, sing-box core and other cores"
arch=('x86_64' 'aarch64')
url="https://github.com/2dust/v2rayN"
license=('GPL-3.0-only')
depends=(
    'dotnet-runtime-8.0'
    'mihomo'
    'sing-box'
    'xray'
)
makedepends=(
    'dotnet-sdk-8.0'
    'git'
)
source=(
    "git+${url}#tag=${pkgver}"
    "extra-source-${pkgver}.zip::${url}-core-bin/raw/refs/heads/master/v2rayN-linux-64.zip"
    "${pkgname}.install"
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
)
sha256sums=('52739f9dd71fcf16e4daecd8b18a5c002f182564566f07ba6f6b6c67d95dcb04'
            'c0392f346ec6a6f640f41330d49aa459adacbb1bd3257f2b806f4765d3f41ecb'
            'a99db9b70fe1f3def2d876ffb8f2ee6848ed99e912c5f3a5db40c95c49ce2790'
            '99348ffdebf72cc76c16c95fc158c21df4788cbc85fe2bee3c08f11f6eff2d97'
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
    mkdir -pv "${pkgdir}/usr/lib/${_pkgname}"
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    cp -r output/* "${pkgdir}/usr/lib/${_pkgname}"
    install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/v2rayn"
    install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/v2rayN.desktop"
    install -Dvm644 "v2rayN.Desktop/v2rayN.png" "$pkgdir/usr/share/pixmaps/v2rayN.png"
    install -Dvm644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Create symlink
    mkdir -pv "${pkgdir}/usr/lib/${_pkgname}/bin"/{mihomo,xray,sing_box}
    for bin in mihomo xray sing-box; do
        ln -sv "../../../../bin/${bin}" "${pkgdir}/usr/lib/${_pkgname}/bin/${bin//-/_}/${bin}"
    done

    # Install geofiles
    bsdtar -xf "${srcdir}/extra-source-${pkgver}.zip" -C "${srcdir}"
    cp -r "${srcdir}/v2rayN-linux-64/bin"/{srss,*.dat,*db} "${pkgdir}/usr/lib/${_pkgname}/bin"
}
