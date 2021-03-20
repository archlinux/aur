# Maintainer: Thaodan <AUR+me@thaodan.de>
pkgname=scratchbox2
pkgver=2.3.90+git31.r26.2b57227
pkgrel=1
pkgdesc="https://git.sailfishos.org/mer-core/scratchbox2"
arch=('x86_64' 'i686')
url="https://git.sailfishos.org/mer-core/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh' 'lua' 'lib32-lua')
optdepends=('qemu-arch-extra: arm and aarch64 support')
source=($pkgname::git+https://git.sailfishos.org/thaodan/scratchbox2#branch=jb52528)
md5sums=('SKIP')
makedepends=(
  'git'
  'lib32-gcc-libs'
)


pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd $pkgname/$pkgname
  ln -sf /usr/share/autoconf/build-aux/config.guess .
  ln -sf /usr/share/autoconf/build-aux/config.sub .
}
build() {
  cd $pkgname/$pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname/$pkgname
  make prefix="$pkgdir/usr" install

  ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
  ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
  ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
  ln -s /usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-dynamic
  ln -s /usr/bin/qemu-aarch64 $pkgdir/usr/bin/qemu-aarch64-dynamic
}
