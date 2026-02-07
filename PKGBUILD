# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>

_pkgname=bobcat
pkgname="lib${_pkgname}"
pkgver=6.06.02
pkgrel=2
pkgdesc="Bobcat (Brokken's Own Base Classes And Templates) library"
arch=('x86_64')
url="https://fbb-git.gitlab.io/bobcat/"
license=('GPL')
depends=('openssl' 'libx11' 'libmilter' 'readline')
makedepends=('icmake>=9.03.01' 'yodl')
source=("https://gitlab.com/fbb-git/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('d7b8211e1b3f95abc8f85e067976ce4ea630dc15e284bfe6bf4c542d319344307c0086ed0940ac3dddca753a9ddea19e2d23c301590726ee0763c94b72bdfdcd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"

  # Since makepkg always defines CXXFLAGS, it overrides the default value
  # defined in the build system, which is problematic because it needs a
  # specific C++ version. Add it back here.
  export CXXFLAGS="${CXXFLAGS} -std=c++20"

  ./build libraries all
  ./build man
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"

  # Since 4.01.02, first argument to install is <what to install> (x = all),
  # and second is the base directory (absolute path, unlike 4.01.00)
  ./build install x "${pkgdir}"

  # fix paths
  ln -s /usr/share/doc/libbobcat5-dev "${pkgdir}/usr/share/doc/${pkgname}"
}
