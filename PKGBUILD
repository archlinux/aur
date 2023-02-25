# Maintainer: meanlint <meanlint@outlook.com>
pkgname=xivlauncher-cn-git
pkgver=1.0.2.2.178bd80
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online CN (Crossplatform rewrite)"
arch=('x86_64')
url='https://github.com/ottercorp/XIVLauncher.Core'
license=('GPL')
depends=(
    'aria2'
    'sdl2' 'lib32-sdl2'
    'libsecret'
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'    'jxrlib'
)
makedepends=('dotnet-sdk>=6' 'python-yaml' 'git')
options=('!strip')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "XIVLauncher.Core::git+https://github.com/ottercorp/XIVLauncher.Core.git"
    "XIVLauncher.desktop"
)
sha512sums=(
    'SKIP'
    '5b737d8575b74e5dacbf96cf40ff57d4b334c2c63f0253768690d7d0f64b2dd8c4807f2e3e7a41944559d87e6089a5356b1dd5d5a4f43fa90ae25258adc85bc8'
)

prepare() {
    cd "${srcdir}/XIVLauncher.Core"
    git submodule update --init --recursive
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
}
