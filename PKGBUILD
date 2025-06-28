# Maintainer: Vincent Post <cent@spline.de>
pkgname=xivlauncher-git
pkgver=1.2.1.r0.g43ed53b
pkgrel=7
epoch=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online (Crossplatform rewrite)"
arch=('x86_64')
url='https://github.com/goatcorp/XIVLauncher.Core/'
license=('GPL')
depends=(
    'aria2'
    'sdl2'
    'libsecret'
    'attr'
    'fontconfig'
    'lcms2'
    'libxml2'
    'libxcursor'
    'libxrandr'
    'libxdamage'
    'libxi'
    'gettext'
    'freetype2'
    'glu'
    'libsm'
    'gcc-libs'
    'libpcap'
    'desktop-file-utils'
    'jxrlib'
)
makedepends=('dotnet-sdk>=8' 'python-yaml' 'git')
optdepends=('steam')
options=('!strip' '!debug')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "XIVLauncher.Core::git+https://github.com/goatcorp/XIVLauncher.Core.git"
    "XIVLauncher.desktop"
    "xivlauncher-core"
)
sha512sums=(
    'SKIP'
    'd94f652f9571598799fcd9bf87cb7d2e54ca924bc100b73024e81efd0fe9fc12d494f7adc500ff34ed1e53c59f94e1d6f3c5ae29a1c33133cc30988197e46389'
    '1b4584216828fac294d9955924a89bba716bcb6f1ec582e50f3169e1501eb3d637cb89f921d887d8aba20eb4a4166915e9812aad634bcfd10ab97324164aaec5'
)

prepare() {
    cd "${srcdir}/XIVLauncher.Core"
    git submodule update --init --recursive
}

pkgver() {
    cd "${srcdir}/XIVLauncher.Core"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/XIVLauncher.Core/src/XIVLauncher.Core/"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release -p:DefineConstants=WINE_XIV_ARCH_LINUX
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/XIVLauncher.Core/misc/linux_distrib/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
    install -D -m755  "${srcdir}/xivlauncher-core" "${pkgdir}/usr/bin/xivlauncher-core"
}
