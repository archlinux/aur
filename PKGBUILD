# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=lrzip-git
pkgver=r815.1a30639
pkgrel=1
pkgdesc="Multi-threaded compression with rzip/lzma, lzo, and zpaq"
arch=( 'x86_64' )
url="https://github.com/ckolivas/lrzip"
license=( 'GPL' )
depends=( 'lzo' 'zlib' 'bash' 'bzip2' )
conflicts=( 'lrzip' )
provides=( 'lrzip' )
_pkgname=lrzip
install=
changelog=
noextract=()
source=("lrzip::git+https://github.com/ckolivas/lrzip.git")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ## most recent annotated tag e.g. 2.0.r6.ga17a017
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## most recent un-annotated tag e.g. 0.71.r115.gd95ee07
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## or:
  ##git describe --long --tags | sed 's/-/.r/;s/-/./'
  ## project uses tags with prefix. e.g. v...
  #git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ## both with fallback, e.g. 0.9.9.r27.g2b039da with tags, else r1581.2b039da
  #( set -o pipefail
  #  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}

build() {
  cd "${_pkgname}"

  CFLAGS="${CFLAGS} -fomit-frame-pointer"
  CXXFLAGS="${CXXFLAGS} -fomit-frame-pointer"

  [ ${CARCH} != x86_64 ] && flags='--enable-asm'
  ./autogen.sh --prefix=/usr "${flags}"
  make
}

check() {
  make -C "${_pkgname}" -k check
}

package() {
  make -C "${_pkgname}" DESTDIR="${pkgdir}" install-strip
}
