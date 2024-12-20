# Maintainer: pikl <me@pikl.uk>
# Contributor: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=oscar
pkgname=oscar
pkgver=1.6.0
pkgrel=2
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment. Fork of the sleepyhead project."
arch=('i686' 'x86_64')
url="https://gitlab.com/CrimsonNape/OSCAR-code"
license=('GPL-3.0-only')
depends=(
  'qt5-tools'
  'qt5-serialport'
)
optdepends=(
  'qt5-wayland'
)
makedepends=(
  'git'
  'glu'
)
provides=("$_pkgname")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/CrimsonNape/OSCAR-code/-/archive/v${pkgver}/OSCAR-code-v${pkgver}.tar.gz"
  'oscar.desktop'
)
sha256sums=('900af74f6e9b36cd1bb7e32d65fb7a5b1de3157d6c3416d63fa9bf527b94d2dd'
            '6b2f735622f218e2ac5ef61475886fadfeeedd5f15b04fa0d54451162ee394ad')

build() {
  cd "${srcdir}/OSCAR-code-v${pkgver}"
  qmake OSCAR_QT.pro
  make -j$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
}

package() {
  cd "${srcdir}/OSCAR-code-v${pkgver}"
  install -Dm755 oscar/OSCAR "$pkgdir/usr/bin/oscar"
  install -Dm644 oscar/icons/logo-lg.png "$pkgdir/usr/share/oscar/icon.png"
  install -Dm644 ../oscar.desktop "$pkgdir/usr/share/applications/oscar.desktop"
  cp -dpr --no-preserve=ownership oscar/Html "$pkgdir/usr/share/oscar"
  cp -dpr --no-preserve=ownership oscar/Translations "$pkgdir/usr/share/oscar"
}
