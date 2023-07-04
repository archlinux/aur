# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=razer-bw-te-ctl-git
_pkgname=razer-bw-te-ctl
pkgver=r13.f85f79d
pkgrel=1
pkgdesc="Razer BlackWidow Tournament Edition configuration tool"
url="https://git.janouch.name/p/razer-bw-te-ctl"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('razer-bw-te-ctl')
provides=('razer-bw-te-ctl')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('libusb')
source=("git+https://git.janouch.name/p/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}
