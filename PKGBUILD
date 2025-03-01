# Maintainer: taotieren <admin@taotieren.com>

pkgbase=uotantoolboxnt
pkgname=uotantoolboxnt
_name=UotanToolboxNT
pkgver=3.0.0
_uiver=6.0.0
pkgrel=0
epoch=
pkgdesc="现代化 Android & OpenHarmony 工具箱 | A Modern Toolbox for Android & OpenHarmony Devices"
arch=($CARCH)
url="https://github.com/Uotan-Dev/UotanToolboxNT"
license=('GPL-3.0-only')
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
replaces=()
depends=(
    android-tools
    usbutils
)
makedepends=(
    git
    dotnet-sdk
    nuget
)
backup=()
options=(!strip !debug)
install=
source=(
    "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "UotanToolboxNT.Binary::git+https://github.com/Uotan-Dev/UotanToolboxNT.Binary.git"
    "https://github.com/Uotan-Dev/SukiUI-Uotan/releases/download/v${_uiver}/SukiUI.${_uiver}.nupkg"
)
sha256sums=('edd784ad20384a82baf98d90e7beef1f08febbd99abbcaa15691254ef330aeb9'
            'SKIP'
            'cd6df48c674b256218855dd6d8789b6bc7322cfa5131614d34ef35730b3a24df')
noextract=()

build() {
    dotnet nuget add source ${srcdir}/${_name}-${pkgver}
    nuget add ${srcdir}/SukiUI.${_uiver}.nupkg -Source ${srcdir}/${_name}-${pkgver}

    cd ${srcdir}/${_name}-${pkgver}

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"
        dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true \
            -p:IncludeNativeLibrariesForSelfExtract=true -o ./publish-x64
    else
        msg2 "build for x64"
        dotnet publish -r linux-arm64 --self-contained true -p:PublishSingleFile=true \
            -p:IncludeNativeLibrariesForSelfExtract=true -o ./publish-arm64
    fi
}

package() {
    cd ${srcdir}/${_name}-${pkgver}

    install -dm755 ${pkgdir}/usr/lib/UotanToolbox

    if [ "$CARCH" == "aarch64" ]; then
        cp -r ${srcdir}/UotanToolboxNT.Binary/Linux_AArch64/* ${pkgdir}/usr/lib/UotanToolbox
        cp -r publish-arm64/* ${pkgdir}/usr/lib/UotanToolbox

    else
        cp -r ${srcdir}/UotanToolboxNT.Binary/Linux_AMD64/* ${pkgdir}/usr/lib/UotanToolbox
        cp -r publish-x64/* ${pkgdir}/usr/lib/UotanToolbox
    fi

    chmod -R a+rX ${pkgdir}/usr/lib/UotanToolbox
    chmod +x ${pkgdir}/usr/lib/UotanToolbox/UotanToolbox
    install -vDm755 UotanToolbox/Assets/Linux/UotanToolbox -t ${pkgdir}/usr/bin
    install -vDm644 UotanToolbox/Assets/Linux/UotanToolbox.desktop -t ${pkgdir}/usr/share/applications
    install -vDm644 UotanToolbox/Assets/Linux/UotanToolbox.png -t ${pkgdir}/usr/share/pixmaps
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
