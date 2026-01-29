pkgname=wonderlab-git
_pkgname=wonderlab
_srcname=WonderLab.Override
pkgver=r1052.ca6d0b8
pkgrel=1
pkgdesc="下一代跨平台 Minecraft 启动器 (dev 分支)"
arch=('x86_64')
url="https://github.com/Lunova-Studio/WonderLab.Override"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime>=8.0' 'fontconfig')
makedepends=('git' 'dotnet-sdk>=8.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')
source=("git+${url}.git#branch=dev"
        "wonderlab.desktop")
sha512sums=('SKIP'
            '6ffed303f1a399689378af1a435c2a358fc71f5dbaa110717d0a58849eccdd9965cdf024f479e84314b65fb181347d60ceec170111e4cee13802bbb000db7880')

pkgver() {
    cd "$_srcname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_srcname"
    git submodule update --init --recursive

    find . -name "*.axaml" -exec sed -i 's|C:\\Users\\[^"]*||g' {} + # ???
}

build() {
    cd "$_srcname"
    dotnet publish WonderLab/WonderLab.csproj \
        --configuration Release \
        --runtime linux-x64 \
        -p:RollForward=Major \
        -p:DebugType=None \
        -p:DebugSymbols=false
}

package() {
    cd "$_srcname"
    
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -a WonderLab/bin/Release/net8.0/linux-x64/publish/* "${pkgdir}/opt/${_pkgname}/"
    
    chmod +x "${pkgdir}/opt/${_pkgname}/WonderLab"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/WonderLab" "${pkgdir}/usr/bin/${_pkgname}"
    
    install -Dm644 "${srcdir}/${_srcname}/WonderLab/Assets/Images/Icons/Icon.1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/wonderlab.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
