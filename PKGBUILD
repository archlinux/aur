# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Shamelessly copied from https://aur.archlinux.org/packages/mtree/
pkgname=mtree-git
pkgver=r27.4f3e901
pkgrel=1
pkgdesc="Map a directory hierarchy"
arch=( 'i686' 'x86_64' )
url="https://github.com/archiecobbs/mtree-port"
license=( 'custom' )
depends=( 'openssl' )
makedepends=( 'openssl' )
_pkgname=mtree
conflicts=( 'mtree' )
install=
changelog=
noextract=()
source=("mtree::git+https://github.com/archiecobbs/mtree-port.git")
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
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 mtree   "${pkgdir}"/usr/bin/mtree
	# install -Dm644 mtree.5 "${pkgdir}"/usr/share/man/man5/mtree.5 ### conflicts with libarchive that already installs mtree.5
	install -Dm644 mtree.8 "${pkgdir}"/usr/share/man/man8/mtree.8
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
