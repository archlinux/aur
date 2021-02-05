_target_arch=mips
_target=mips64-unknown-linux-gnu
pkgname=${_target}-linux-api-headers
pkgver=5.1
pkgrel=0
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url='http://www.gnu.org/software/libc'
license=(GPL2)
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
md5sums=('15fbdff95ff98483069ac6e215b9f4f9'
         'SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E')

build() {
  cd linux-$pkgver

  make ARCH=${_target_arch} mrproper
  make ARCH=${_target_arch} headers_check
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target" ARCH=${_target_arch} headers_install

  # use headers from libdrm
  rm -rf "$pkgdir/usr/$_target/include/drm"

  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
