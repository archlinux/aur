# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>

_pkgname=bobcat
pkgname="lib${_pkgname}"
pkgver=6.02.02
pkgrel=1
pkgdesc="Bobcat (Brokken's Own Base Classes And Templates) library"
arch=('x86_64')
url="https://fbb-git.gitlab.io/bobcat/"
license=('GPL')
depends=('openssl' 'libx11' 'readline')
makedepends=('icmake>=9.03.01' 'libmilter' 'yodl')
source=("https://gitlab.com/fbb-git/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('4908fef5685e5402795000fafee7fcb3c42c4cf94571121df7e1afd977961f3d3036393f7140867abb9a019713ddb886053e4900172ef1072944b77444d2b11d')

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
