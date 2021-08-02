# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>

pkgname=ipmctl-git
pkgver=v02.00.00.3871.r2.g9c576e93
pkgrel=1
pkgdesc="util for configuring and managing Intel Optane DC persistent memory modules (DCPMM)."
arch=('x86_64')
url="https://github.com/intel/ipmctl"
license=(GPL3)
depends=("ndctl")
makedepends=("cmake" "git" "python3" "ndctl")
source=(
  ${pkgname}::git+https://github.com/intel/ipmctl
  os_mkdir_for_gcc_11.patch
)
md5sums=('SKIP'
         '64811bb8558e36916502141f4eefce9c')

pkgver()
{
  cd $srcdir/$pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  echo "Applying the patch to fix gcc_11 compatibility issue."
  cp os_mkdir_for_gcc_11.patch "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  git am os_mkdir_for_gcc_11.patch
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build && cd build
  cmake -DRELEASE=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
  make -j all
}

package() {
  cd $srcdir/$pkgname/build
  make install
  mv $pkgdir/usr/etc $pkgdir/etc
  mv $pkgdir/usr/var $pkgdir/var
}

# vim:set ts=2 sw=2 et:

