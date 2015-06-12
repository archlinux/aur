# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=infamousplugins-git
pkgver=262.87434ec
pkgrel=1
pkgdesc="A collection of open-source LV2 plugins"
arch=('i686' 'x86_64')
url="http://infamousplugins.sourceforge.net"
license=('GPL2')
groups=('lv2-plugins')
depends=('glibc' 'fftw')
makedepends=('git' 'qt4' 'lv2')
provides=('infamousplugins')
conflicts=('infamousplugins')
source=("${pkgname%-*}-code"::'git://github.com/ssj71/infamousPlugins.git')
md5sums=('SKIP')
_plugins="CellularAutomatonSynth EnvelopeFollower Hip2B Stuck PowerCut PowerUp EWham"

pkgver() {
    cd "$srcdir/${pkgname%-*}-code"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/${pkgname%-*}-code"
    for plugin in $_plugins
    do
      qmake-qt4 -o src/$plugin/Makefile src/$plugin/$plugin.pro
      make -C src/$plugin
    done
    gcc src/rule.c -o src/infamous-rule
    make -C src/cheap_distortion
}

package() {
    cd "$srcdir/${pkgname%-*}-code"
    for plugin in $_plugins
    do
      make INSTALL_ROOT="$pkgdir" -C src/$plugin install
    done
    install -Dm755 src/infamous-rule "$pkgdir/usr/bin/infamous-rule"
    make INSTALL_DIR="$pkgdir/usr/lib/lv2" -C src/cheap_distortion install
    install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
    install -Dm644 COPYING "$pkgdir/usr/share/doc/${pkgname%-*}/COPYING"
    install -Dm644 README  "$pkgdir/usr/share/doc/${pkgname%-*}/README"
}

