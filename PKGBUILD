# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=oorexx-beta
pkgver=5.0.0.r11404
pkgrel=1
pkgdesc="open source implementation of Object Rexx"
arch=('x86_64')
url="http://www.oorexx.org/"
license=('CPL')
depends=('bash' 'gcc-libs-multilib')
makedepends=('subversion' 'cmake')
optdepends=('tcsh: for C shell sample'
	    'sh: for sh shell sample')
provides=("rexx")
conflicts=("oorexx")
install=${pkgname}.install
source=("${pkgname}::svn+svn://svn.code.sf.net/p/oorexx/code-0/main/trunk/"
 oorexx-beta-5.0.0-rxapid.patch
 ${pkgname}.install)
sha256sums=('SKIP'
            '9b0912eb203f4d53e0ae9098f368d8cff4fc30906dcc5760ebd28ffa14f79808'
            '6a4119e428d416c594e70bae0be6557685e69f0bc1c46c820c77cdc5d9cd5f19')
pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "5.0.0.r%s" "${ver//[[:alpha:]]}"
}
prepare() {
  cd "${pkgname}"
  if [ ! -d ../build ]; then mkdir ../build; fi
}
build() {
  cd "${pkgname}"
  cd ../build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE "../${pkgname}"
  make || return 1
}
package() {
  cd "${pkgname}"
  cd ../build
  make DESTDIR="${pkgdir}" install || return 1
  cd "${pkgdir}"
  patch -p1 -i "${srcdir}/oorexx-beta-5.0.0-rxapid.patch"
}
