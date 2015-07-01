# Maintainer: petRUShka <petrushkin[at]yandex[dot]ru>
pkgname=clcc
_pkgver_major=0
_pkgver_minor=3
_pkgver_patch=0
pkgver=$_pkgver_major.$_pkgver_minor.${_pkgver_patch}
_pkgbuild=25
pkgrel=6
pkgdesc="CLCC is a compiler for OpenCL kernel source files. It's tool for application developers who want to verify their OpenCL code actually gets compiled by the driver before their program tries to compile it on-demand."
url="http://clcc.sourceforge.net/"
arch=('x86_64' 'i686')
license=('Boost Software License 1.0')
depends=('boost' 'boost-libs' 'libcl')
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://downloads.sourceforge.net/project/clcc/v$pkgver/clcc-$pkgver-$_pkgbuild-src.zip")
md5sums=('7ec003cc775d1cd06e789fb054c1d695')

build() {
  cd "${srcdir}/"
  sed -i 's/__LINUX__/__GNUC__/' src/options.cpp
  sed -i 's/set(Boost_USE_STATIC_LIBS ON)/set(Boost_USE_STATIC_LIBS OFF)/' src/CMakeLists.txt
  mkdir -p build
  cd build
  cmake ../src -DCMAKE_INSTALL_PREFIX=/usr -DCLCC_VERSION_MAJOR=$_pkgver_major -DCLCC_VERSION_MINOR=$_pkgver_minor -DCLCC_VERSION_PATCH=$_pkgver_patch -DCLCC_VERSION_BUILD=$_pkgbuild
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/license.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
