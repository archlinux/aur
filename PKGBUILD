# Maintainer: pikl <me@pikl.uk>
# Contributor: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=oscar
pkgname=oscar
pkgver=v1.5.1
pkgrel=1
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment. Fork of the sleepyhead project."
arch=('i686' 'x86_64')
url="https://gitlab.com/pholy/OSCAR-code"
license=('GPL')
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
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/pholy/OSCAR-code/-/archive/${pkgver}/OSCAR-code-${pkgver}.tar.gz"
  'oscar.desktop'
  'odr-fix.patch'
)
sha256sums=('d1ce2f5f656715f059e683e9d1d2c86ed0607194d3de97b469c25f0b78c64341'
            '6b2f735622f218e2ac5ef61475886fadfeeedd5f15b04fa0d54451162ee394ad'
            '5a887520f92ffde54835adf5507c6f8a93a54561866d07573d2a80bcaf8f3691')

prepare() {
  cd "${srcdir}/OSCAR-code-${pkgver}"
  git apply ../*.patch || echo "No patches found"
}

build() {
  cd "${srcdir}/OSCAR-code-${pkgver}"
  qmake OSCAR_QT.pro
  make -j$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
}

package() {
  cd "${srcdir}/OSCAR-code-${pkgver}"
  install -Dm755 oscar/OSCAR "$pkgdir/usr/bin/oscar"
  install -Dm644 oscar/icons/logo-lg.png "$pkgdir/usr/share/oscar/icon.png"
  install -Dm644 oscar.desktop "$pkgdir/usr/share/applications/oscar.desktop"
  cp -dpr --no-preserve=ownership oscar/Html "$pkgdir/usr/share/oscar"
  cp -dpr --no-preserve=ownership oscar/Translations "$pkgdir/usr/share/oscar"
}
