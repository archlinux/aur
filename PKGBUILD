# Maintainer: Bink
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

_pkgname=cool-retro-term
pkgname=$_pkgname-git
pkgver=2.0.0.beta1.r2
pkgrel=1
pkgdesc='A terminal emulator which mimics the look and feel of the old cathode tube screens.'
arch=('i686' 'x86_64')
url="https://github.com/Swordfish90/$_pkgname"
license=('GPL-3.0-or-later')
depends=('qmltermwidget' 'qt6-base' 'qt6-declarative' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+${url}.git"
  "git+https://github.com/KDAB/KDSingleApplication.git"
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  git -C "${_pkgname}" describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.g.*//'
}

prepare() {
  cd "$_pkgname" || exit

  git submodule init
  git submodule set-url KDSingleApplication "$srcdir/KDSingleApplication"
  git -c protocol.file.allow=always submodule update

  # Don't build vendored qmltermwidget as we package it separately.
  sed -i '/qmltermwidget/d' cool-retro-term.pro
}

build() {
  cd "$_pkgname" || exit

  qmake6
  make
}

package() {
  cd "$_pkgname" || exit

  make INSTALL_ROOT="$pkgdir" install
}
