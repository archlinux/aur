# Maintainer: dreieck
# Contributor (umbim-git): Jared Baldridge <jrb@expunge.us>

_pkgname=uqmi
pkgname="${_pkgname}-git"
_gitname="${_pkgname}"
pkgver=r191.7914da4
pkgrel=1
pkgdesc='OpenWrt QMI modem utility'
url='https://git.openwrt.org/project/uqmi.git'
arch=('i686' 'x86_64' 'armv5te' 'armv6' 'armv7' 'armv8' 'aarch64')
license=('GPL-2.0-or-later')
depends=(
  'glibc'
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
 '9ca8dc8eff58f6c01029a1f663bf232f10b48ca078f6c325236042fa13f7dac5'
)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/001-sbin-fix.patch"

  git log > git.log
}


build() {
  cd "$srcdir"
  _CFLAGSADDITIONS+=" -Wno-dangling-pointer"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS
  cmake -S "${_gitname}" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "$srcdir"
  make -C build DESTDIR="$pkgdir" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_gitname}/git.log"
}
