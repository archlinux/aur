# Contributor: PitBall

luaver=5.1
pkgname=lua${luaver//.}bind
pkgver=0.9.1
pkgrel=2
pkgdesc="A library that helps you create bindings between C++ and Lua51"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('unzip' 'boost' 'boost-build')
depends=("lua${luaver//.}" 'gcc-libs')
replaces=('luabind' 'lua52bind' 'lua53bind')
conflicts=('luabind' 'lua52bind' 'lua53bind')
provides=('luabind')
source=("http://downloads.sourceforge.net/${pkgname//${luaver//.}}/${pkgname//${luaver//.}}-${pkgver}.tar.gz"
        luabind-0.9.1-boost149fix.patch
        luabind-0.9.1-boost157fix.patch)

build() {
  cd ${srcdir}/${pkgname//${luaver//.}}-${pkgver}
  for diff in ${srcdir}/*.patch; do
  patch -Np1 -i ${diff}; done

  sed -r -e "s|^(\s*local\ names\s*=\s*).*|\1"liblua${luaver}\ liblua${luaver//.}\ \;"|" -i Jamroot

  b2 -d+2 release --prefix=${pkgdir}/usr/ link=static,shared
}

package() {
  cd ${srcdir}/${pkgname//${luaver//.}}-${pkgver}

  b2 release --prefix=${pkgdir}/usr/ link=static,shared install

  # copy license
  install -Dm644 ${srcdir}/${pkgname//${luaver//.}}-${pkgver}/LICENSE \
      ${pkgdir}/usr/share/licenses/${pkgname//${luaver//.}}/LICENSE
}

md5sums=('8a323fb51d07dad5cfdb12c432793d55'
         'b7315e791201c8f737702a7ccc8e3d69'
         'a64c06783893c92cd58ef99ce4e94a08')
