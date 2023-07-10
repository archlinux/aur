# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>

pkgname=crypto++-git
pkgver=8.8.0.r12.g6ecc789d
pkgrel=1
pkgdesc="A free C++ class library of cryptographic schemes"
arch=(x86_64)
url="https://www.cryptopp.com/"
license=('custom: public domain' boost)
depends=(gcc-libs)
makedepends=(git)
provides=(crypto++)
conflicts=(crypto++)
source=("git+https://github.com/weidai11/cryptopp.git")
b2sums=('SKIP')

pkgver() {
  cd cryptopp
  git describe --long --tags | sed 's/^CRYPTOPP_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  export CXXFLAGS="$CXXFLAGS -DNDEBUG -fPIC"
  make PREFIX=/usr -C cryptopp dynamic cryptest.exe libcryptopp.pc
}

check() {
  make PREFIX=/usr -C cryptopp test
}

package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr -C cryptopp install
  install -Dm 644 cryptopp/License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # Remove cryptest.exe and test files, only needed for check() and bloats the package
  # because cryptest.exe is linked statically.
  rm -rf "${pkgdir}"/usr/{bin,share/cryptopp}
}
