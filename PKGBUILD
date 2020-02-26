# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=fluent-bit-git
pkgver=1.3.0.r432.g66837f34
pkgrel=1
pkgdesc="Collect data/logs from different sources, unify and send them to multiple destinations"
url="https://fluentbit.io/"
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('git' 'cmake' 'make' 'gcc')
depends=()
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
  cd ${pkgname}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DFLB_TLS=1 ..
  make
}

package() {
  cd ${pkgname}/build

  make DESTDIR="$pkgdir/" install

  # move /lib/* to /usr/lib
  mv ${pkgdir}/lib/* ${pkgdir}/usr/lib
  rmdir $pkgdir/lib

  install -DTm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
