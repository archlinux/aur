# Maintainer: Jared Johnson <jaredj@gmx.com>
pkgname=fvim
pkgver=0.2_88_g17b59dd
pkgrel=1
pkgdesc="Cross platform Neovim front-end UI, built with F# + Avalonia"
arch=('any')
url="https://github.com/yatli/fvim"
license=('MIT')
groups=()
depends=('neovim' 'ttf-dejavu')
makedepends=('dotnet-sdk-preview')
optdepends=()
provides=('fvim')
conflicts=('fvim')
source=("https://github.com/yatli/fvim/archive/v0.2-88-g17b59dd.tar.gz")
md5sums=('SKIP')
options=('staticlibs')

build() {
    cd $(echo "${srcdir}/${pkgname}-${pkgver}" | sed -e "s/_/-/g")
    mkdir ${srcdir}/build
    dotnet publish \
        -f netcoreapp3.0 \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -o ${srcdir}/build
}

package() {
    cd $(echo "${srcdir}/${pkgname}-${pkgver}" | sed -e "s/_/-/g")

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48/apps"

    install -m755 lib/fvim-linux-launcher "${pkgdir}/usr/bin/fvim"
    install Assets/fvim.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/fvim.png"
    install lib/fvim.desktop "${pkgdir}/usr/share/applications/fvim.desktop"
    cp -R ${srcdir}/build/* "${pkgdir}/usr/share/fvim"
    chmod -R 755 ${pkgdir}/usr/share/fvim
    chmod 744 ${pkgdir}/usr/share/fvim/*.dll
    chmod 744 ${pkgdir}/usr/share/fvim/*.so
    chmod 644 ${pkgdir}/usr/share/fvim/FVim.*
}
