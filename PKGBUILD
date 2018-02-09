# Maintainer: dreieck
# Contributor (umbim-git): Jared Baldridge <jrb@expunge.us>

_pkgname=uqmi
pkgname="${_pkgname}-git"
_gitname="${_pkgname}"
pkgver=r110.8ceeab6
pkgrel=2
pkgdesc='OpenWrt QMI modem utility'
url='https://git.openwrt.org/project/uqmi.git'
arch=('i686' 'x86_64' 'armv5te' 'armv6' 'armv7' 'armv8' 'aarch64')
license=('GPL2')
depends=(
  'json-c'
  'libubox'
)
makedepends=(
  'git'
  'cmake'
  'gcc'
  'make'
  'patch'
  'pkg-config'
)
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=(
  "${_gitname}::git+git://git.openwrt.org/project/${_gitname}.git"
  '001-sbin-fix.patch'
)
sha256sums=(
 'SKIP'
 '1f0b8f7c17c8bc3cd099e27573839cb6ef105ed97dda81d808eb899c33e883c8'
)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/001-sbin-fix.patch"
}


build() {
  cd "$srcdir/$_gitname"
  cmake CMakeLists.txt \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
