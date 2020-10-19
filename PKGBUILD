# Maintianer: Tim Schumacher <timschumi@gmx.de>

_target_arch=mips
_target=mipsr5900el-unknown-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=5.4
pkgrel=2
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://github.com/frno7/linux'
license=(GPL2)
makedepends=('git')
source=(git+https://github.com/frno7/linux#branch=ps2-v${pkgver})
sha1sums=('SKIP')

prepare() {
  cd linux

  # MIPS: PS2: Add "WITH Linux-syscall-note" to GS and GIF header files
  git cherry-pick 1aeb7fdf7a6107d5e7be8b518dcec27127ea854c
}

build() {
  cd linux

  make ARCH=$_target_arch mrproper
  make ARCH=$_target_arch headers_check
}

package() {
  cd linux

  make ARCH=$_target_arch INSTALL_HDR_PATH="$pkgdir/usr/$_target" headers_install

  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -or -name ..install.cmd \) -delete
}
