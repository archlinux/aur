# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=4.14.8
_basever=${pkgver%.*}
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(any)
url='http://www.gnu.org/software/libc'
license=(GPL2)
source=(https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basever}.tar.{xz,sign}
        https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign})
md5sums=('bacdb9ffdcd922aa069a5e1520160e24'
         'SKIP'
         'e4a4d2abd61516d4eaf4789ca5e113ff'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

prepare() {
  cd linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -p1 -i "$srcdir/patch-$pkgver"
}

build() {
  cd linux-${_basever}

  make mrproper
  make headers_check
}

package() {
  cd linux-${_basever}
  make INSTALL_HDR_PATH="$pkgdir/usr" headers_install

  # use headers from libdrm
  rm -r "$pkgdir/usr/include/drm"
  
  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -o -name ..install.cmd \) -delete
}
