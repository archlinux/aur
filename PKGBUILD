# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
_pkgname=SparkleShare
pkgver=3.28
pkgrel=2
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="https://www.sparkleshare.org/"
license=('GPL3')
depends=('webkit2-sharp' 'notify-sharp-3' 'curl' 'git-lfs' 'openssh' 'gvfs')
makedepends=(git meson)
_commit=3176efc8c38f5effba780aa9bbc0b1d5a313129a  # tags/3.28
source=("git+https://github.com/hbons/SparkleShare.git#commit=$_commit"
        "0001-Use-gtk-status-icon-by-default.patch")
sha256sums=('SKIP'
            '748a4aa153689d59aa6145eb91b863d8f7668fcb901a7773befd44afd1f904d9')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Fix build
  sed -i '/post-install.sh/d' meson.build

  # Use gtk status icon by default
  patch -Np1 -i ../0001-Use-gtk-status-icon-by-default.patch
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
