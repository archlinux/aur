# Maintainer:  kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Kujiu <kujiu+arch@kujiu.org>
# Contributor: Renaud G. <renaud@rolisteam.org>

pkgname=rolisteam
_pkgname=rolisteam
pkgver=1.10
pkgrel=3
pkgdesc="Virtual tabletop software for tabletop role playing games with remote players. Installs the client (rolisteam), the server (roliserver), a dice roller (dice), the character sheet editor (rcse) and a mindmap app (mindmap)."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.rolisteam.org"
license=(GPL)
depends=('qt6-svg' 'qt6-base' 'qt6-multimedia' 'qt6-webengine' 'qt6-quick3dphysics' 'qt6-quick3d' 'qt6-remoteobjects' 'qt6-scxml' 'qt6-translations' 'qt6-webchannel' 'qt6-httpserver' 'qt6-multimedia-ffmpeg')
makedepends=('qt6-tools' 'git')
source=("$pkgname::git+https://invent.kde.org/rolisteam/rolisteam.git#branch=release/${pkgver}"
        "git+https://invent.kde.org/rolisteam/rolisteam-diceparser.git#branch=master")

sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd $pkgname
  git submodule init
  git config submodule.src/libraries/diceparser.url "$srcdir"/rolisteam-diceparser
  git -c protocol.file.allow=always submodule update
}

build()
{
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake -S ../ -B . "-DBUILD_TESTING=OFF" "-DGENERATE_TS_FILES=ON" "-DCMAKE_BUILD_TYPE=Release" "-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr"
  cmake --build . --target all --parallel 16
}

package()
{
  cd "${srcdir}/${_pkgname}"
  install -Dm644 resources/packaging/Linux/rolisteam.desktop "${pkgdir}/usr/share/applications/rolisteam.desktop"
  install -Dm644 resources/packaging/Linux/rcse.desktop "${pkgdir}/usr/share/applications/rcse.desktop"
  cd build
  cmake --install .
  chmod -R g-w "${pkgdir}"/usr
}
