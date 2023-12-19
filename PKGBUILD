# Maintainer: Rankyn Bass <rankyn@proton.me>
pkgname=xivlauncher-rb
pkgver=1.0.6.8
pkgrel=2
epoch=2
_tag=aa19fd4a8d9fbe4c8aa676ac2419993b607413fe # git rev-parse rb-v${pkgver}
pkgdesc="Custom launcher for Final Fantasy XIV Online with RB Patches!"
arch=('x86_64')
url='https://github.com/rankynbass/XIVLauncher.Core/tree/RB-patched'
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
    "XIVLauncher.Core::git+https://github.com/rankynbass/XIVLauncher.Core.git#tag=${_tag}"
    "XIVLauncher.desktop"
    "xivlauncher-rb"
    "openssl_fix.cnf"
)
sha512sums=(
    'SKIP'
    '1d500eaa424fd484d96441252f6efa4239fedc37dc4a465c5a2d59478c82cb2d03913ad2fe2fb8bf140430cbe75b5b82dcad0a8b062790253401e8729a58f4df'
    '3661b24d0c381a8bc5b7bcdeb1e3c1435ea2e09b6984485fb4520a4eaf305a9c1cf817952a880409ea270a44d87185bb193a0e2f8a151525ce55f98adb8241ce'
    'f8e0e412481748ed4f0d25761af9d0e7ee89dd1e9912ca22b5aea7b90a431e1f9c3267d64478b3baf04a412a0ce7c2e7f8fb60e4648bf3af5fd0c2206a381549'
)

prepare() {
    cd "${srcdir}/XIVLauncher.Core"
    git submodule update --init --recursive
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/XIVLauncher.Core/src/XIVLauncher.Core/"
    echo "dotnet publish -r linux-x64 --sc -o \"${srcdir}/build\" --configuration Release -p:BuildHash=$(git rev-parse --short HEAD)"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release -p:BuildHash=$(git rev-parse --short HEAD)
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/xivlauncher-rb/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher-RB.desktop"
    install -D -m644 "${srcdir}/XIVLauncher.Core/misc/linux_distrib/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher-rb.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/xivlauncher-rb/"
    cp "${srcdir}/xivlauncher-rb" "${pkgdir}/usr/bin/xivlauncher-rb"
    cp "${srcdir}/openssl_fix.cnf" "${pkgdir}/opt/xivlauncher-rb/openssl_fix.cnf"
}
