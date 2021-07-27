# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Nazar Mishturak <nazarmx@gmail.com"
# Contributor: hexchian <i at hexchain dot org>

# shellcheck disable=2034,2154

pkgname=crun-git
_pkgname=crun
pkgver=0.20.1.r17.g0b0b288
pkgrel=1
pkgdesc="A fast and lightweight fully featured OCI runtime and C library for running containers"
url="https://github.com/containers/crun"
arch=('any')
depends=('yajl' 'systemd-libs' 'libcap' 'libseccomp')
makedepends=('libtool' 'python3' 'go-md2man' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=('GPL2')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname" || exit 1
  git submodule update --recursive
}

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname" || exit 1
  ./autogen.sh
  ./configure --prefix=/usr --enable-dynamic
  make
}

package() {
  cd "$srcdir/$_pkgname" || exit 1
  make DESTDIR="$pkgdir" install
}
