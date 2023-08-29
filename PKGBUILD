# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Jason Lenz <Jason@Lenzplace.org>
_pkgname=oscar
pkgname=oscar-git
pkgver=..r4286.32bef5b8
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
  "git+https://gitlab.com/pholy/OSCAR-code.git"
  'oscar.desktop'
)
sha256sums=('SKIP'
            '6b2f735622f218e2ac5ef61475886fadfeeedd5f15b04fa0d54451162ee394ad')

pkgver() {
  cd OSCAR-code
  _major=$(sed -rn 's/.*major_version = ([0-9]+).*/\1/p' < oscar/version.h)
  _minor=$(sed -rn 's/.*minor_version = ([0-9]+).*/\1/p' < oscar/version.h)
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo $_major.$_minor.$_gitversion
}

build() {
  cd OSCAR-code
  git apply ../../*.patch || echo "No patches found"
  qmake OSCAR_QT.pro
  make -j$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
}

package() {
  install -D $srcdir/OSCAR-code/oscar/OSCAR $pkgdir/usr/bin/oscar
  install -Dm644 $srcdir/OSCAR-code/oscar/icons/logo-lg.png $pkgdir/usr/share/oscar/icon.png
  install -Dm644 $srcdir/oscar.desktop $pkgdir/usr/share/applications/oscar.desktop

  cp -dpr --no-preserve=ownership $srcdir/OSCAR-code/oscar/Html $pkgdir/usr/share/oscar
  cp -dpr --no-preserve=ownership $srcdir/OSCAR-code/oscar/Translations $pkgdir/usr/share/oscar
}

# vim:set ts=2 sw=2 et:
