# Maintainer: Pizero <zhaory200707@outlook.com>
# Upstream: https://github.com/ClassIsland/ClassIsland

pkgname=classisland-git
pkgver="cedac5b759fe1a5eac4f873d34a1ff5c2bc4b0f6"
pkgrel=1
pkgdesc="一款适用于班级多媒体屏幕的课表信息显示工具，可以一目了然地显示各种信息。"
arch=('x86_64')
url="https://github.com/ClassIsland/ClassIsland"
license=('GPL-3.0-only')
depends=('dotnet-runtime-8.0' 'glibc' 'gcc-libs' 'fontconfig' 'hicolor-icon-theme')
source=()
sha256sums=()
makedepends=('git' 'dotnet-sdk-8.0')
conflicts=('classisland')
# FIXME: classisland need full git repo
# source=("$pkgname::git+https://github.com/ClassIsland/ClassIsland.git#branch=dev")
# sha256sums=('SKIP')

# TODO: fix namcap errors

prepare() {
    # FIXME: classisland need full git repo
    cd "${srcdir}"
    if [ -d "ClassIsland" ]; then
        cd ClassIsland
        git pull
    else
        # master is stable branch
        git clone https://github.com/ClassIsland/ClassIsland.git -b dev
        cd ClassIsland
    fi
    # FIXME: default is ssh, but user maybe hasn't a key
    git submodule set-url vendors/EdgeTtsSharp https://github.com/ClassIsland/EdgeTtsSharp.git
    git submodule update --init --recursive
}

pkgver() {
    cd "${srcdir}/ClassIsland"
    git log -n 1 --format=format:"%H"
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
    mkdir -p "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/ClassIsland/out/ClassIsland/" "${pkgdir}/usr/lib/${pkgname}"
    find "${pkgdir}/usr/lib/${pkgname}" -type f -name '*.dll' -exec strip $STRIP_STATIC {} \;
    find "${pkgdir}/usr/lib/${pkgname}" -type f -name '*.so' -exec strip $STRIP_SHARED {} \;
    chmod 775 "${pkgdir}/usr/lib/${pkgname}/ClassIsland.Desktop"

    # magic file
    echo "deb" > "${pkgdir}/usr/lib/${pkgname}/PackageType"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/ClassIsland/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/usr/bin"
    ln -srfv "${pkgdir}/usr/lib/${pkgname}/ClassIsland.Desktop" "${pkgdir}/usr/bin/ClassIsland"

    # FIXME: hard coded
    install -Dm644 "${srcdir}/ClassIsland/ClassIsland/Assets/ShortcutTemplates/cn.classisland.app.desktop" "${pkgdir}/usr/share/applications/cn.classisland.app.desktop"

    sed -i "s/{0}/${pkgver}/g; s|{1}|/usr/lib/${pkgname}/ClassIsland.Desktop|g; s/Icon=.*/${pkgname}/g" "${pkgdir}/usr/share/applications/cn.classisland.app.desktop"
    # install -Dm644 "${srcdir}/ClassIsland/ClassIsland/Assets/ShortcutTemplates/ClassSwap.url" "${pkgdir}/usr/share/applications/ClassSwap.url"
    install -Dm644 "${srcdir}/ClassIsland/ClassIsland/Assets/FreedesktopIcons/AppLogo@128w.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}
