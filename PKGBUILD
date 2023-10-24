
# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

_pkgname=nomad-firewall
pkgname=nomad-firewall-git
pkgver=0.1.r116.gdbe0809
pkgrel=1
pkgdesc="kcm module for firewall from nomad desktop"
arch=('i686' 'x86_64')
url="https://github.com/nomad-desktop/nomad-firewall"
license=('GPL3')
depends=(
  'kauth5'
  'kcmutils5'
  'kconfig5'
  'kconfigwidgets5'
  'kcoreaddons5'
  'kdeclarative5'
  'kdelibs4support'
  'ki18n5'
  'kio5'
  'knewstuff5'
  'net-tools'
  'plasma-framework5'
  'ufw'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdesignerplugin'
  'kdoctools5'
)
source=('git+https://github.com/nomad-desktop/nomad-firewall.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_SYSCONFDIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  ln -s kcms/org.nxos.firewall.so "$pkgdir/usr/lib/qt/plugins/org.nxos.firewall.so"
}
