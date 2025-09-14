# Maintainer: 小阚LittleKan <littlekan233@qq.com>
# Maintainer: RoboMico <robomico at outlook dot com>

pkgname=classisland
_appname=cn.classisland.app
pkgver=1.7.105.1
pkgrel=1
pkgdesc="适用于班级大屏的课表小工具。Class schedule displaying tool for interactive whiteboards in classrooms."
arch=('x86_64' 'aarch64')
url="https://github.com/ClassIsland/ClassIsland"
license=('GPL-3.0-only')
install=${pkgname}.install
depends=(
    'bash'
    'dotnet-runtime-8.0'
    'fontconfig'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
)
makedepends=(
    'dotnet-sdk-8.0'
    'git'
)
source=(
    "git+${url}.git#tag=${pkgver}"
    "git+https://github.com/ClassIsland/EdgeTtsSharp.git#branch=classisland-v2"
    "${pkgname}.sh"
)
sha256sums=(
    'SKIP'
    'SKIP'
    '5342aed758213e2068c1a41c696b317b935fe491158fc750f454156686a35388'
)
options=('!debug')

prepare() {
    cd "${srcdir}/ClassIsland"
    cp -r "${srcdir}/EdgeTtsSharp" ./vendors
    git remote set-url origin https://github.com/ClassIsland/ClassIsland # resolve the SourceLink issue
}
build() {
    cd "${srcdir}/ClassIsland"
    ./build.sh PublishApp \
        --configuration Release \
        --os-name linux \
        --arch x64 \
        --build-type full \
        --build-name app \
        --package folder \
        -p:DebugSymbols=false
}
package() {
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/ClassIsland/out/ClassIsland" "${pkgdir}/opt"
    mv "${pkgdir}/opt/ClassIsland" "${pkgdir}/opt/${pkgname}"
    printf "deb" > "${pkgdir}/opt/${pkgname}/PackageType"
    install -Dm644 "${srcdir}/ClassIsland/ClassIsland/Assets/AppLogo_AppLogo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/ClassIsland/ClassIsland/Assets/ShortcutTemplates/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/{0}/${pkgver}/" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/{1}/\/usr\/bin\/${pkgname}/" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
