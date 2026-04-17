# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target_arch=powerpc
_target=${_target_arch}-linux-gnu
pkgname=${_target}-linux-api-headers
pkgver=7.0
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url='http://www.gnu.org/software/libc'
license=(GPL2)
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
md5sums=('1d35f79af3a784f986e4c3a154c0ecf5'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
	      '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd linux-$pkgver

  make ARCH=$_target_arch mrproper
}

package() {
  cd linux-${pkgver}
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target" ARCH=$_target_arch headers_install

  # use headers from libdrm
  rm -rf "$pkgdir/usr/$_target/include/drm"

  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
