# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
pkgname=badvpn-git
pkgver=r1949.4b7070d
pkgrel=2
pkgdesc="NCD scripting language, tun2socks proxifier, P2P VPN"
arch=($CARCH)
url=https://github.com/ambrop72/${pkgname%-git}
# https://spdx.org/licenses/
license=(custom:BSD-3-Clause)
# https://wiki.archlinux.org/index.php/Arch_package_guidelines#Package_dependencies
# Do not rely on transitive dependencies
depends=(nspr nss openssl)
makedepends=(git cmake)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} tun2socks{,-git})
source=(${pkgname%-git}::git+https://github.com/ambrop72/${pkgname%-git}.git#branch=master)
md5sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Check *RELEASE* variables in CMakeLists.txt
# https://wiki.archlinux.org/index.php/CMake_package_guidelines#Fixing_the_automatic_optimization_flag_override
build() {

  cd ${pkgname%-git}

  # cmake -B build -S .
  cmake -B build -S . \
    \
    -DBUILD_CLIENT=ON \
    -DBUILD_DOSTEST=ON \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_FLOODER=ON \
    -DBUILD_NCD=ON \
    -DBUILD_SERVER=ON \
    -DBUILD_TESTS=ON \
    -DBUILD_TUN2SOCKS=ON \
    -DBUILD_UDPGW=ON \
    \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_PLUGIN_LIBS=ON \
    \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}/" \
    -DCMAKE_INSTALL_SBINDIR=bin

  # ccmake -B build -S .
  # echo; pwd; echo; return 1

  # /usr/bin/time --format="\n  wall clock time - %E\n" \
  make -C build

}

package() {
  cd ${pkgname%-git}
  make -C build DESTDIR="$pkgdir" install
  install -vDm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}COPYING
}
