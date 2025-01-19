# Maintainer: Christopher Torres <christopher dot torres at azgstudio dot com>

pkgname=hidviz-git
pkgver=0.2.r4.g31b2bcc
pkgrel=1
pkgdesc="Tool for in-depth analysis of USB HID devices communication"
arch=('i686' 'x86_64')
url="https://github.com/hidviz/hidviz"
license=('GPL3')
depends=('libusb' 'protobuf' 'qt6-base' 'cmake')
makedepends=('git')
provides=("hidviz")
conflicts=("hidviz")
source=("${pkgname%}::git+$url"
        "fix_absl_linker.patch"
        "fix_missing_libhidviz_server_daemon.patch")
sha256sums=('SKIP'
            'e2d1b15f0da31b4e9ce5ba0adad0bd8f5a79ec3623805873e3d1bfc617336690'
            'af3208207b4e19b7c0657e6d59ee5aff1d0b12dd2ff83e944913c891459348a8')
_where="$PWD" # track basedir

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  git apply "$srcdir"/../fix_absl_linker.patch "$srcdir"/../fix_missing_libhidviz_server_daemon.patch
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_LIBEXECDIR="lib/hidviz" ..
}

build() {
  cd "$pkgname"/build
  make
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir" install
}
