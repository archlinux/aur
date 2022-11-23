# Maintainer: Thaodan <AUR+me@thaodan.de>
pkgname=scratchbox2
pkgver=2.3.90+git58
pkgrel=1
pkgdesc="Scratchbox2 crosscompiling environment"
arch=('x86_64' 'i686')
url="https://github.com/sailfishos/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh' 'lua' 'lib32-lua' 'lua-posix')
optdepends=('qemu-arch-extra: arm and aarch64 support')
#_branch=fix_building_against_glibc_2_34
options=('!lto')
_vcs_str="${_branch+#branch=}${_branch:-#tag=$pkgver}"
_src_subdir=$pkgname${_branch+-$_branch}
source=(
  $_src_subdir::git+https://github.com/sailfishos/scratchbox2$_vcs_str
)
md5sums=('SKIP')

makedepends=(
  'git'
  'lib32-gcc-libs'
)


if [ $_branch ] ; then
  pkgver() {
    cd "$_src_subdir"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  }
fi

prepare() {
  cd $_src_subdir
  ln -sf /usr/share/autoconf/build-aux/config.guess .
  ln -sf /usr/share/autoconf/build-aux/config.sub .
}
build() {
  cd $_src_subdir
  ./autogen.sh
  ./configure --prefix=/usr
  make V=1
}

package() {
  cd $_src_subdir
  make prefix="$pkgdir/usr" install

  ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
  ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
  ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
  ln -s /usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-dynamic
  ln -s /usr/bin/qemu-aarch64 $pkgdir/usr/bin/qemu-aarch64-dynamic
}
