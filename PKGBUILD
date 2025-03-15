# Maintainer: taotieren <admin@taotieren.com>

pkgbase=uotantoolboxnt
pkgname=uotantoolboxnt
_name=UotanToolboxNT
pkgver=3.3.5
_uiver=6.0.0
pkgrel=1
epoch=
pkgdesc="现代化 Android & OpenHarmony 工具箱 | A Modern Toolbox for Android & OpenHarmony Devices"
arch=($CARCH)
url="https://github.com/Uotan-Dev/UotanToolboxNT"
license=('GPL-3.0-only')
provides=(${pkgname} ${pkgname%nt} ${_name%NT} ${_name})
conflicts=(${pkgname} ${pkgname%nt} ${_name%NT} ${_name})
replaces=()
depends=(
    gcc-libs
    glibc
    java-runtime
    sh
    android-tools
    usbutils
)
makedepends=(
    git
    dotnet-host
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
sha256sums=('fdf1acffee2018ce37312f4f79959212d513bcd10ebb4fd8e0cb92ebe379ddad'
            'SKIP'
            'cd6df48c674b256218855dd6d8789b6bc7322cfa5131614d34ef35730b3a24df')
noextract=()

prepare() {
    git -C "${srcdir}/UotanToolboxNT.Binary" clean -dfx
    cd ${srcdir}/${_name}-${pkgver}
    dotnet clean && dotnet restore
}

build() {
    dotnet nuget add source ${srcdir}/${_name}-${pkgver}
    nuget add ${srcdir}/SukiUI.${_uiver}.nupkg -Source ${srcdir}/${_name}-${pkgver}

    cd ${srcdir}/${_name}-${pkgver}

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "build for arm64"
        dotnet publish -r linux-arm64 --self-contained true -p:PublishSingleFile=true \
            -p:IncludeNativeLibrariesForSelfExtract=true -o ./publish-arm64
    elif [ "$CARCH" == "loong64" ]; then
        msg2 "build for loong64"
        dotnet publish -r linux-loong64 --self-contained true -p:PublishSingleFile=true \
            -p:IncludeNativeLibrariesForSelfExtract=true -o ./publish-loong64
    elif [ "$CARCH" == "x86_64" ]; then
        msg2 "build for x64"
        dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true \
            -p:IncludeNativeLibrariesForSelfExtract=true -o ./publish-x64
    else
        msg2 "Unsupported architectures"
    fi
}

package() {
    cd ${srcdir}/${_name}-${pkgver}

    install -dm755 ${pkgdir}/usr/lib/UotanToolbox

    if [ "$CARCH" == "aarch64" ]; then
        msg2 "aarch64"
        cp -r ${srcdir}/UotanToolboxNT.Binary/Linux_AArch64/* ${pkgdir}/usr/lib/UotanToolbox
        cp -r publish-arm64/* ${pkgdir}/usr/lib/UotanToolbox
    elif [ "$CARCH" == "loong64" ]; then
        msg2 "loong64"
        cp -r ${srcdir}/UotanToolboxNT.Binary/Linux_LoongArch64/* ${pkgdir}/usr/lib/UotanToolbox
        cp -r publish-loong64/* ${pkgdir}/usr/lib/UotanToolbox
    elif [ "$CARCH" == "x86_64" ]; then
        msg2 "x64"
        cp -r ${srcdir}/UotanToolboxNT.Binary/Linux_AMD64/* ${pkgdir}/usr/lib/UotanToolbox
        cp -r publish-x64/* ${pkgdir}/usr/lib/UotanToolbox
    else
        msg2 "Unsupported architectures"
    fi

    chmod -R a+rX ${pkgdir}/usr/lib/UotanToolbox
    chmod +x ${pkgdir}/usr/lib/UotanToolbox/UotanToolbox
    install -vDm755 UotanToolbox/Assets/Linux/UotanToolbox -t ${pkgdir}/usr/bin
    install -vDm644 UotanToolbox/Assets/Linux/UotanToolbox.desktop -t ${pkgdir}/usr/share/applications
    install -vDm644 UotanToolbox/Assets/Linux/UotanToolbox.png -t ${pkgdir}/usr/share/pixmaps
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
