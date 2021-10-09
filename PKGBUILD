# Maintainer: Jared Johnson <jaredj@gmx.com>
pkgname=fvim
pkgver=0.3.468_g123a102
_pkgver=$(echo "${pkgver}" | sed -e "s/_/-/g")
pkgrel=1
pkgdesc="Cross platform Neovim front-end UI, built with F# + Avalonia"
arch=('x86_64')
url="https://github.com/yatli/fvim"
license=('MIT')
groups=()
depends=('neovim' 'ttf-dejavu')
makedepends=('dotnet-host' 'dotnet-sdk' 'dotnet-runtime')
optdepends=()
provides=('fvim')
conflicts=('fvim')
source=("https://github.com/yatli/fvim/archive/refs/tags/v0.3.468+g123a102.tar.gz")
md5sums=('SKIP')
options=('staticlibs')

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    dotnet publish fvim.fsproj \
        -f net5.0 \
        -c Release \
        -r linux-x64 \
        --self-contained
}

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}"

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48/apps"

    install -m755 lib/fvim-linux-launcher "${pkgdir}/usr/bin/fvim"
    install Assets/fvim.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/fvim.png"
    install lib/fvim.desktop "${pkgdir}/usr/share/applications/fvim.desktop"
    cp -dpr bin/Release/net5.0/linux-x64/* "${pkgdir}/usr/share/fvim"
    chmod 755 "${pkgdir}/usr/share/fvim/FVim"
    chmod 755 "${pkgdir}/usr/bin/fvim"
}
