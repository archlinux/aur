# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from heimdall-git; original contributors:
# Contributor: Todd Musall
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Contributor: Lari Tikkanen

pkgname=heimdall-nogui-git
_pkgname="heimdall"
pkgver=1.4.2.r7.ga2cfdaa
pkgrel=2
pkgdesc="A cross-platform open-source utility to flash firmware (aka ROMs) onto Samsung Galaxy S devices."
arch=('i686' 'x86_64')
url="https://glassechidna.com.au/heimdall/"
license=('MIT')
depends=('libusb')
makedepends=('cmake' 'git')
optdepends=('android-udev: Udev rules to connect Android devices to you linux box')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("$_pkgname::git+https://gitlab.com/BenjaminDobell/Heimdall.git"
        "BridgeManager.patch")
md5sums=('SKIP'
         '8fce869eb9539b6b410b1a52370c3824')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  patch -Np1 -i ../BridgeManager.patch

  mkdir -p build
}

build() {
  cd $_pkgname/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISABLE_FRONTEND=ON \
    ..

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install

  install -m644 -D ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
