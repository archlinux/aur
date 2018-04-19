# Maintainer: MCMic <come@chilliet.eu>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=nikki
pkgver=1.1.1
pkgrel=1
pkgdesc="Nikki and the Robots platformer game"
arch=('any')
url="https://github.com/nikki-and-the-robots"
license=('LGPL' 'CCPL')
makedepends=('cmake' 'pkg-config' 'stack')
depends=('libsndfile' 'openal' 'qt4' 'libzip' 'gmp')
optdepends=('nikki-levels-git: community levels')
source=("https://github.com/nikki-and-the-robots/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('54f77bf0cd2ae8c159935f12cc1da449')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/src

  export STACK_ROOT=${srcdir}/.stack
  ./build-qtwrapper.sh
  stack setup
  stack build
  ./linuxDeploy.hs --no-copy-shared-objects
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/src/nikki

  # folders
  install -d "$pkgdir"/{opt/nikki,usr/bin}

  # binaries + launcher
  install -m755 {nikki.sh,restarter} "$pkgdir"/opt/nikki
  ln -s /opt/nikki/nikki.sh "$pkgdir"/usr/bin/nikki

  # data
  cp -r data "$pkgdir"/opt/nikki

  # doc + license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nikki/LICENSE
  install -m644 LICENSES/*.txt "$pkgdir"/usr/share/licenses/nikki
  install -Dm644 README "$pkgdir"/usr/share/doc/nikki/README
  install -m644 THANKS "$pkgdir"/usr/share/doc/nikki
  ln -s /opt/nikki/data/manual "$pkgdir"/usr/share/doc/nikki/

  # .desktop entry
  install -Dm644 data/svg/nikki-icon.svg "$pkgdir"/usr/share/pixmaps/nikki.svg
  install -Dm644 data/menu/nikki.desktop "$pkgdir"/usr/share/applications/nikki.desktop
}
