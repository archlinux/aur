# Maintainer: Qiang <lq95v5@gmail.com>
pkgname=xivlauncher-cn
pkgver=1.0.0.9
_pkgver=ae08df3a025c8178d104ba8356cdb90b82362539
pkgrel=1
pkgdesc="Custom launcher for FFXIV CN"
arch=('x86_64')
url='https://github.com/ottercorp/FFXIVQuickLauncher/'
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
optdepends=('steam')
options=('!strip')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "FFXIVQuickLauncher::git+https://github.com/ottercorp/FFXIVQuickLauncher.git#commit=${_pkgver}"
    "XIVLauncher.desktop"
    "sdologinentry64.dll"
)
sha512sums=(
    'SKIP'
    '7f6324cb31f99194fdd44c34b49bb3b7f04bad1b6cbb1b914959219b545bc3653643edac29134edebec82de00e36a83d1afdcc3e20f9bdaa9cbff8ceac3f5d16'
    '46e3eb353306e14d28f9d6ad6dde76c47e8ea724b66c95cd509f2ab28ce14ea3e7ac948953c6625714e8998e38de13107d9d5f319edb462ab3e9e0498438ae7e'
)

build() {
    mkdir -p "${srcdir}/build"
    mkdir -p "${srcdir}/build/Resources"
    cp  "${srcdir}/sdologinentry64.dll" "${srcdir}/build/Resources/"
    cd "${srcdir}/FFXIVQuickLauncher/src/XIVLauncher.Core/"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release -p:DefineConstants=WINE_XIV_ARCH_LINUX
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/FFXIVQuickLauncher/misc/linux_distrib/512.png" "${pkgdir}/share/icons/hicolor/512x512/apps/xivlauncher.png"
    cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
}
