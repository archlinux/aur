# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.30
pkgrel=1
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
sha256sums=('14981073744d29faadfba31bc0b5cac294a39c6a40f21fecb9f2c69e1f26f8c1')

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
