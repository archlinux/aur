#Maintainer: Chao Guo(jeffguorg#gmail.com)
#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=6.4.3
pkgrel=1
pkgdesc='Nutstore integration for Nautilus'
arch=(x86_64 aarch64)
url='https://www.jianguoyun.com/'
license=('CC-BY-ND-3.0 AND GPL-2.0-or-later')
depends=(libnautilus-extension)
optdepends=(nutstore)
makedepends=(
  'at-spi2-core'
  'autoconf'
  'automake'
  'gcc'
  'm4'
  'make'
  'libtool'
  'patch'
  'pkg-config'
)
source=(
  "https://pkg-cdn.jianguoyun.com/static/exe/installer/$pkgver/nutstore_client-$pkgver-linux-src-installer-public.tar.gz"
  '00-remove-dependency-from-configure.patch'
)
sha256sums=(
  '8816d91324d2346966e0019981aa6e5df94bb1a016ac5146366dea37d2f4b3ce'
  '5049f6fb727241f45f2a90061b3f68973a0e29fba43b86f67bbc7ae74de96c94'
)

prepare() {
  cd "$srcdir/nutstore_linux_src_installer"

  # Make the GDK dependency check optional
  patch -p1 <"$srcdir/00-remove-dependency-from-configure.patch"

  # Regenerate the configure script from the patched configure.ac
  ./update-toolchain.sh
}

build() {
  cd "$srcdir/nutstore_linux_src_installer"
  ./configure || return 1
  make || return 1
}

package() {
  cd "$srcdir/nutstore_linux_src_installer"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
