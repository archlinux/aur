# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.29
pkgrel=3
pkgdesc="Linux GUI for cloning & restoring disk partitions to & from compressed image files."
arch=('x86_64')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
         'python-setuptools'
         'python-gobject'
         'python-yaml'
         'python-pyzmq'
         'python-humanize'
         'gtk3'
         'partclone'
         'zeromq'
         'zstd')
optdepends=('polkit: to run as non-root user'
            'pigz: adds compression option'
            'lz4: adds compression option')
makedepends=('cargo')
# zmq/apart-core issues with CXXFLAGS lto
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e79b1ef244831696861853c160b157c7d4e6e30e942227e5e9ac60d0faebaee4')

build() {
  cd "$pkgname-$pkgver"
  if [[ "${CXXFLAGS:-}" == *"-march=x86-64-v3"* ]]; then
    echo "Warning: Removing '-march=x86-64-v3' from CXXFLAGS env as this is known to cause issues" >&2
    export CXXFLAGS="${CXXFLAGS//-march=x86-64-v3/}"
  fi
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
