# Maintainer: Ivan Semkin <ivan at semkin dot ru>
# Contributor Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Contributor ZeroDot1 <zerodot1@bk.ru>

pkgname=mellowplayer-git
_pkgname=MellowPlayer
pkgver=3.5.6.r4.gba304af5
pkgrel=1
pkgdesc='Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop.'
url='https://gitlab.com/ColinDuquesnoy/MellowPlayer'
license=(GPL)
conflicts=(mellowplayer)
provides=(mellowplayer)
arch=('x86_64' 'aarch64')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-translations' 'qt5-graphicaleffects' 'xdg-utils' 'libnotify' 'libevent')
makedepends=('qt5-tools' 'cmake' 'mesa' 'ninja' 'pkgconf')
optdepends=( 'chromium-widevine: DRM needed for Spotify and Amazon Music' 'pepper-flash: needed for Tidal')
source=("git+$url.git"
        'widevine-patch.patch')
md5sums=('SKIP'
         '67f8c5c6af4b770a4017a5ca9f137b90')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "${srcdir}/widevine-patch.patch" "${srcdir}/${_pkgname}/src/main/share/applications/mellowplayer.desktop"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -GNinja -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
  ninja
}

package() {
  cd "${srcdir}/${_pkgname}"
  ninja install
}
