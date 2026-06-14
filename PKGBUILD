# Maintainer: Robert Schiele <rschiele@gmail.com>
# Contributor: pikl <me@pikl.uk>
# Contributor: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=oscar
pkgname=oscar
pkgver=2.0.0
pkgrel=1
pkgdesc="Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment. Fork of the sleepyhead project."
arch=('i686' 'x86_64')
url="https://gitlab.com/CrimsonNape/oscar-sql"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-serialport'
  'libgcc'
  'zlib'
  'glibc'
  'libstdc++'
)
optdepends=(
  'qt6-wayland'
)
makedepends=(
  'qt6-tools'
  'git'
  'glu'
)
provides=("$_pkgname")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/CrimsonNape/oscar-sql/-/archive/v${pkgver}/oscar-sql-v${pkgver}.tar.gz"
  'oscar.desktop'
)
sha256sums=('cec954602e71561663386e9e2d34159c4933cf31ad0950166fe94bca90c9cb0f'
            '6b2f735622f218e2ac5ef61475886fadfeeedd5f15b04fa0d54451162ee394ad')

prepare() {
  cd "${srcdir}/oscar-sql-v${pkgver}"
  sed -i -e 's/" ) + appName/oscar" )/' oscar/SleepLib/common.cpp
}

build() {
  cd "${srcdir}/oscar-sql-v${pkgver}"
  qmake6 OSCAR_QT.pro
  make
}

package() {
  cd "${srcdir}/oscar-sql-v${pkgver}"
  install -Dm755 oscar/OSCAR20 "$pkgdir/usr/bin/oscar"
  install -Dm644 oscar/icons/logo-lg.png "$pkgdir/usr/share/oscar/icon.png"
  install -Dm644 ../oscar.desktop "$pkgdir/usr/share/applications/oscar.desktop"
  cp -dpr --no-preserve=ownership oscar/Html "$pkgdir/usr/share/oscar"
  cp -dpr --no-preserve=ownership oscar/Translations "$pkgdir/usr/share/oscar"
}
