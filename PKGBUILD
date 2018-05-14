# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=bro-git
pkgver=2.5.r569.g057c982b9
pkgrel=1
pkgdesc='A powerful framework for network analysis and security monitoring. (IDS Intrusion Detection System)'
url='https://www.bro.org'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git' 'fakeroot' 'cmake' 'make' 'flex' 'bison' 'swig')
depends=('bash' 'libpcap' 'openssl-1.0' 'zlib' 'python')
optdepends=('geoip' 'gperftools' 'sendmail' 'curl' 'actor-framework')
backup=('etc/bro/broctl.cfg' 'etc/bro/networks.cfg' 'etc/bro/node.cfg' 'etc/bro/broccoli.conf')
source=("${pkgname}::git+https://github.com/bro/bro.git" 'cmake_OpenSSLTests.patch')
md5sums=('SKIP' 'c0bd228adfa3d34cb7e6623467f62502')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Update submodules
  git submodule update --init --recursive

  # Change the cmake/OpenSSLTests.cmake file to bypass targeting the wrong library version...
  patch -N -p1 -i "${srcdir}/cmake_OpenSSLTests.patch" || true

  # Create Makefiles
  ./configure --prefix=/usr --spooldir=/var/spool/bro --logdir=/var/log/bro --conf-files-dir=/etc/bro --with-openssl=/usr/include/openssl-1.0

  # Temporary fix until openssl-1.1 is supported
  sed -i 's/^OPENSSL_CRYPTO_LIBRARY.*/OPENSSL_CRYPTO_LIBRARY:FILEPATH=\/usr\/lib\/openssl-1.0\/libcrypto.so/' build/CMakeCache.txt
  sed -i 's/^OPENSSL_INCLUDE_DIR.*/OPENSSL_INCLUDE_DIR:PATH=\/usr\/include\/openssl-1.0/' build/CMakeCache.txt
  sed -i 's/^OPENSSL_SSL_LIBRARY.*/OPENSSL_SSL_LIBRARY:FILEPATH=\/usr\/lib\/openssl-1.0\/libssl.so/' build/CMakeCache.txt
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
  install -DTm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
