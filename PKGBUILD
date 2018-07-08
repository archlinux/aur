# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: ZeroDot1 <zerodot1@bk.ru>
pkgname=mellowplayer
_pkgname=MellowPlayer
pkgver=3.4.0
pkgrel=2
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-translations' 'qt5-graphicaleffects' 'xdg-utils' 'libnotify' 'libevent')
makedepends=('qt5-tools' 'qbs')
optdepends=( 'qt5-webengine-widevine: DRM needed for Spotify' 'pepper-flash: needed for Tidal and Deezer')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz" 
        "widevine-path.patch")
md5sums=('60aac9e1f5f32d699920e44e2f3af790'
         '67f8c5c6af4b770a4017a5ca9f137b90')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/widevine-path.patch" "${srcdir}/${_pkgname}-${pkgver}/src/main/share/applications/mellowplayer.desktop"
    
    qbs-setup-toolchains --detect
    qbs-setup-qt $(which qmake) qt5
    qbs-config defaultProfile qt5
}

build() {
      cd "${srcdir}/${_pkgname}-${pkgver}"
  qbs build config:release
}

package() {
      cd "${srcdir}/${_pkgname}-${pkgver}"
  qbs install --install-root "${pkgdir}/usr" config:release
}


