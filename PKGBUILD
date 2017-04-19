# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=bro-git
pkgver=2.5.r125.g81dbbbd3a
pkgrel=1
pkgdesc="A powerful framework for network analysis and security monitoring. (IDS Intrusion Detection System)"
url="https://www.bro.org"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git' 'fakeroot' 'binutils' 'cmake' 'make' 'gcc' 'flex' 'bison' 'swig')
depends=('bash' 'libpcap' 'openssl' 'zlib' 'python')
optdepends=('geoip' 'gperftools' 'sendmail' 'curl' 'actor-framework')
backup=('etc/bro/broctl.cfg' 'etc/bro/networks.cfg' 'etc/bro/node.cfg' 'etc/bro/broccoli.conf')
source=("${pkgname}::git://git.bro.org/bro")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Update submodules
  git submodule update --init --recursive

  # Create Makefiles
  ./configure --prefix=/usr --spooldir=/var/spool/bro --logdir=/var/log/bro --conf-files-dir=/etc/bro
}

build() {
  cd ${pkgname}
  make -j$(getconf _NPROCESSORS_ONLN)
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
  install -DTm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
