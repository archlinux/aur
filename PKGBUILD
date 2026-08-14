# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libsepol
pkgver=3.11
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('LGPL2.1')
groups=('selinux')
makedepends=('flex')
depends=('glibc')
# Disable LTO as it is incompatible with the static library
options=(staticlibs '!lto')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  '68D21823342A13683AEB3E4EFB4C685B5DC1C13E'  # Petr Lautrbach <lautrbach@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('79f3d2c88f44b7eb5cf54d9792e03232297e17f97a179163f2750099a00f164d'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  export CFLAGS="${CFLAGS} -fno-semantic-interposition"
  make
}

package() {
  provides+=(
    libsepol.so
  )

  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SHLIBDIR=/usr/lib install
}
