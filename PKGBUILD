# Maintainer: Vincent Post <cent@spline.de>
pkgname=xivlauncher-git
pkgver=6.2.31.r18.g93a818c
pkgrel=4
pkgdesc="Custom Launcher for Final Fantasy XIV Online (Crossplatform rewrite)"
arch=('x86_64')
url='https://github.com/goatcorp/FFXIVQuickLauncher/'
license=('GPL')
depends=(
    'aria2'
    'sdl2'
    'libsecret'
)
makedepends=('dotnet-sdk>=6')
optdepends=('steam')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "FFXIVQuickLauncher::git+https://github.com/goatcorp/FFXIVQuickLauncher.git"
    "https://raw.githubusercontent.com/goatcorp/FFXIVQuickLauncher/master/src/XIVLauncher.Core/Resources/logo.png"
    "XIVLauncher.desktop"
)
sha512sums=(
    'SKIP'
    '4f16ba269ecd60c16a125db5e986d0bdabd69ac51d03ccb01a7203ddd04dea9d40147ee412bbfc37921ca83ff70a966258ae729bcada95ce1582b43160686694'
    '5ac774f858d4015c59e6758e2a706b93e822bca9c046ed87210deabc141ac101020d2654fbcf8314f9409a4cfcf921d1e26ec0a3b0beab02d1bcd045fb6e6f14'
)

pkgver() {
    cd "${srcdir}/FFXIVQuickLauncher"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/FFXIVQuickLauncher/src/XIVLauncher.Core/"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/logo.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
}
