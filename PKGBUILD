# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=sensei-raw-ctl-git
_pkgname=sensei-raw-ctl
pkgver=r48.5ffdd26
pkgrel=1
pkgdesc="SteelSeries Sensei Raw configuration tool"
url="https://git.janouch.name/p/sensei-raw-ctl"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('sensei-raw-ctl')
provides=('sensei-raw-ctl')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('libusb')
optdepends=('gtk3: the GUI frontend'
            'polkit: the GUI frontend')
install=sensei-raw-ctl.install
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
