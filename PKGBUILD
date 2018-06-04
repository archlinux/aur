# Maintainer: Ivan Semkin <ivan at semkin dot ru>
# Contributor Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Contributor ZeroDot1 <zerodot1@bk.ru>

pkgname=mellowplayer-git
_pkgname=MellowPlayer
pkgver=3.0.0.r432.4ecdcde0
pkgrel=1
pkgdesc='Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop.'
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=(GPL)
conflicts=(mellowplayer)
provides=(mellowplayer)
arch=(x86_64)
depends=(qt5-base qt5-webengine qt5-svg qt5-quickcontrols2 qt5-quickcontrols qt5-translations qt5-graphicaleffects xdg-utils libnotify libevent qbs)
makedepends=(qt5-tools)
optdepends=('qt5-webengine-widevine: DRM needed for Spotify' 'pepper-flash: needed for Tidal and Deezer')
source=('git://github.com/ColinDuquesnoy/MellowPlayer'
        'widevine-patch.patch')
md5sums=('SKIP'
         '67f8c5c6af4b770a4017a5ca9f137b90')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe --always | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "${srcdir}/widevine-patch.patch" "${srcdir}/${_pkgname}/src/main/share/applications/mellowplayer.desktop"
    
    qbs-setup-toolchains --detect
    qbs-setup-qt $(which qmake) qt5
    qbs-config defaultProfile qt5
}

build() {
  cd "${srcdir}/${_pkgname}"
  qbs build config:release
}

package() {
  cd "${srcdir}/${_pkgname}"
  qbs install --install-root "${pkgdir}/usr" config:release
}
# vim:set ts=2 sw=2 et:
