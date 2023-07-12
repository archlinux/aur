# Maintainer: Marcanicus <marcanicus@proton.me>
pkgname=xivlauncher-rb
pkgver=1.0.7
pkgrel=1
epoch=1
pkgdesc="Custom launcher for Final Fantasy XIV Online with RB Patches!"
arch=('x86_64')
url='https://github.com/Marcanicus/XIVLauncher.Core'
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
makedepends=('dotnet-sdk>=6' 'git')
optdepends=('steam')
options=('!strip')
source=(
    "XIVLauncher.Core::git+https://github.com/Marcanicus/XIVLauncher.Core.git#branch=RB-patched"
    "XIVLauncher.desktop"
)
sha512sums=(
    'SKIP'
    'b9a4beedda1dd1d83ce9eab84b9d2e74d1b5f51fbf4ce5900f864fb882450c486301701b959916e7459dcce65a4911355e08ed53494ec8046c0c1d638e9035e8'
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
