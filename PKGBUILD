#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Giancarlo Razzolini <grazzolini@archlinux.org>
#Credits: Frederik Schwan <freswa at archlinux dot org>
#Credits: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
#Credits: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc

pkgname=linux-api-headers-git
pkgdesc='Kernel headers sanitized for use in userspace'
pkgver=6.9rc5.r0.ged30a4a
_commit=ed30a4a51bb196781c8058073ea720133a65596f
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace (git version)'
arch=(any)
url='https://www.gnu.org/software/libc'
license=(GPL2)
makedepends=(rsync git make)
conflicts=(linux-api-headers)
provides=('linux-api-headers=$pkgver' linux-api-headers)
source=(git+https://github.com/torvalds/linux.git#commit="${_commit}")

pkgver(){
  cd "${srcdir}"/linux

  #echo $major.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
  #git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/.rc/rc/' | sed 's/v//'
  # cutting off 'foo-' prefix that presents in the git tag
  # same as above
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/.rc/rc/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}"/linux

  make clean
  make mrproper
}

package(){
  cd "${srcdir}"/linux

  make INSTALL_HDR_PATH="${pkgdir}"/usr headers_install

  # use headers from libdrm
  rm -r "${pkgdir}"/usr/include/drm
}

sha256sums=('d41506badb7a566e2762ed0cb60057ac67b1c9b01a0bdf223c117d4a443302c8')

# vim:set ts=8 sts=2 sw=2 et:
