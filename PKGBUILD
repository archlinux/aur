# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=4.16.1
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(any)
url='http://www.gnu.org/software/libc'
license=(GPL2)
source=(https://www.kernel.org/pub/linux/kernel/v4.x/linux-${pkgver%.*}.tar.{xz,sign}
        https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign})
md5sums=('1357fb4ee7c288fdeac5d4e0048f5c18'
         'SKIP'
         'bade764e616e8283b6a620f268337651'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

prepare() {
  cd linux-${pkgver%.*}
  patch -p1 -i "$srcdir/patch-$pkgver"
}

build() {
  cd linux-${pkgver%.*}

  make mrproper
  make headers_check
}

package() {
  cd linux-${pkgver%.*}
  make INSTALL_HDR_PATH="$pkgdir/usr" headers_install

  # use headers from libdrm
  rm -r "$pkgdir/usr/include/drm"
  
  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -o -name ..install.cmd \) -delete
}
