# Contributor: PitBall

luaver=5.2
pkgname=lua${luaver//.}bind
pkgver=0.9.1
pkgrel=4
pkgdesc="A library that helps you create bindings between C++ and Lua52"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
makedepends=('unzip' 'boost' 'boost-build')
depends=("lua${luaver//.}" 'gcc-libs')
replaces=('luabind' 'lua51bind' 'lua53bind')
conflicts=('luabind' 'lua51bind' 'lua53bind')
provides=('luabind')
source=("http://downloads.sourceforge.net/${pkgname//${luaver//.}}/${pkgname//${luaver//.}}-${pkgver}.tar.gz"
        000-luabind-0.9.1-boost149fix.patch
        001-luabind-use-lua_compare.patch
        002-luabind-deprecated-LUA_GLOBALSINDEX.patch
        003-luabind-use-lua_rawlen.patch
        004-luabind-getsetuservalue.patch
        005-luabind-lua_resume_extra_param.patch
        006-luabind-luaL_newstate.patch
        007-luabind-lua-52-fix-test.patch
        008-luabind-lua_pushglobaltable.patch
        009-luabind-0.9.1-boost157fix.patch)

build() {
  cd ${srcdir}/${pkgname//${luaver//.}}-${pkgver}
  for diff in ${srcdir}/*.patch; do
  patch -Np1 -i ${diff}; done

  #export LUA_PATH=/usr/include/lua${luaver}
  sed -e "s|51|${luaver//.}|" -e "s|5.1|${luaver}|" -i Jamroot
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
         'f946eda70f37b623fc6d2dc00cc9d330'
         '69a6dfea8dd6143601d2b537b55feafa'
         '3c94f13cdb5e4cc450bcba7421529ec8'
         'd3611164a4ecb80c62f540f54e00ac05'
         '47302600179f5aa9e1934f8a20dffc1f'
         'c49bf430a89d44a3602cb44f2826318a'
         'e6818960faabf4d2e98d621492279533'
         '4d0624aa94394c6f17307ea69c6a7387'
         'a64c06783893c92cd58ef99ce4e94a08')
