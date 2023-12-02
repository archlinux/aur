# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=gngeo
pkgname=$_pkgname-git
pkgver=0.8.r21.ged06739
pkgrel=2
pkgdesc="A portable command-line NeoGeo Emulator (development version)"
arch=('i686' 'x86_64')
url="https://github.com/pepone42/gngeo"
license=('custom GPL')
depends=('zlib' 'sdl')
makedepends=('git' 'glu')
makedepends_i686=('nasm')
optdepends=('libgl: OpenGL renderer backend')
conflicts=("$_pkgname")
provides=("$_pkgname")
replaces=("gngeo-hg")
install=$pkgname.install
source=($_pkgname::"git+https://github.com/pepone42/gngeo.git#branch=gngeo"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('SKIP'
            '75f5aee2e7d33c61ed220aad8baf0db0d05aa93752aa99dd9e9a3771605dfc62'
            'b543425d51bd669fe5081b0b89492f18163c292194ac2a4acff683ba2a60063e')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/^gngeo_//;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname

  # change path
  sed 's|games/lib|share|' -i sample_gngeorc

  # fixup makefile
  sed 's|SUBDIRS = src|& gngeo.dat|' -i Makefile.am
}

build() {
  cd $_pkgname

  ./bootstrap
  ./configure --prefix=/usr CFLAGS="$CFLAGS -fcommon" # gcc 10 fix
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir/" install

  # install icon, .desktop, sample config and license file
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 sample_gngeorc "$pkgdir"/usr/share/$_pkgname/sample_gngeorc
  install -d "$pkgdir"/usr/share/doc/$_pkgname
  install -m644 AUTHORS FAQ NEWS README TODO "$pkgdir"/usr/share/doc/$_pkgname
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
