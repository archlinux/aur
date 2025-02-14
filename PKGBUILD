# Maintainer: Jérôme Poulin (ticpu) <jeromepoulin@gmail.com>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=fluent-bit-git
pkgver=3.2.4.r77.gc2b3d4768
pkgrel=1
pkgdesc="Collect data/logs from different sources, unify and send them to multiple destinations"
url="https://fluentbit.io/"
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('git' 'cmake' 'make' 'gcc')
depends=('luajit')
optdepends=()
backup=('etc/fluent-bit/fluent-bit.conf' 'etc/fluent-bit/parsers.conf' 'etc/fluent-bit/plugins.conf')
source=("${pkgname}::git+https://github.com/fluent/fluent-bit.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  # fix warning about src path being included
  sed -i 's|@CMAKE_SOURCE_DIR@|/usr/src/fluent-bit|g' include/fluent-bit/flb_info.h.in

  # fix _FORTIFY_SOURCE re-definition warning
  sed -i -r -e 's/ -D_FORTIFY_SOURCE=.//' CMakeLists.txt

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DFLB_TLS=1 \
    -DFLB_SECURITY=On \
    -DFLB_RELEASE=On \
    -DFLB_PREFER_SYSTEM_LIB_LUAJIT=On \
    ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="$pkgdir/" install
  install -DTm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
