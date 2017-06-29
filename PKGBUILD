# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=quiterss-git
pkgver=0.18.6.r8.g243d40f6
pkgrel=1
pkgdesc="Fast and light RSS/Atom feed reader written in Qt/С++"
arch=('i686' 'x86_64')
url="https://quiterss.org"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'qt5-multimedia' 'qt5-webkit')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/QuiteRSS/quiterss.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  # revert commit so it builds on qt5-5.9.0
  git revert --no-edit --no-commit 66b8b01a2281a85c4d84d6a78626faab00e643ea
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 QuiteRSS.pro \
    PREFIX=/usr \
    CONFIG+=release \
    CONFIG+=LINUX_INTEGRATED \
    DISABLE_PHONON=1
  make
}

package() {
  cd "${pkgname%-*}"
  make INSTALL_ROOT="$pkgdir/" install
  # makefile doesn't install translations?
  cp release/target/lang/*.qm "$pkgdir"/usr/share/quiterss/lang/
}
