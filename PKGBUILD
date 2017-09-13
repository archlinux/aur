# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=thor-codec
_pkg=thor
pkgver=r204.2b2edc8
# Versioned like h265
pkgrel=1
url=https://tools.ietf.org/html/draft-fuldseth-netvc-thor
pkgdesc="The Thor video codec is a block-based hybrid video codec similar in structure to widespread standards."
license=("custom:BSD")
depends=("glibc")
arch=("i686" "x86_64")

source=("${_pkg}::git+https://github.com/cisco/thor.git")
md5sums=("SKIP")

pkgver() {
  cd "${_pkg}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkg}"

  make DESTDIR=${pkgdir} prefix=/usr \
	localstatedir=/var sysconfdir=/etc \
	sbindir=/usr/bin bindir=/usr/bin \
	libdir=/usr/lib libexecdir=/usr/lib
}

package() {
# Binaries on src/thor/build directory
# Look like the makefile not have a install option
#  cd "${srcdir}/${_pkg}"
#
#  make DESTDIR=${pkgdir} prefix=/usr \
#	localstatedir=/var sysconfdir=/etc \
#	sbindir=/usr/bin bindir=/usr/bin \
#	libdir=/usr/lib libexecdir=/usr/lib \
#	install

mkdir -p "${pkgdir}/usr/bin"
mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

cp "${srcdir}/${_pkg}/build/Thordec" "${pkgdir}/usr/bin/"
cp "${srcdir}/${_pkg}/build/Thorenc" "${pkgdir}/usr/bin/"
cp "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
