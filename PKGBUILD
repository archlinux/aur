# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=scopes
pkgname=$_pkgname-hg
pkgver=r1775+.c1e8ee6bd379+
pkgrel=1
pkgdesc="Scopes is a retargetable programming language & infrastructure"
url="https://scopes.rocks"
arch=('x86_64')
license=('MIT')
depends=('clang' 'spirv-tools')
makedepends=('mercurial' 'llvm' 'genie-git' 'make' 'cmake' 'spirv-headers')
conflicts=('scopes')
provides=('scopes')

source=('hg+https://hg@bitbucket.org/duangle/scopes'
        'SPIRV-Cross.tar.gz::https://github.com/KhronosGroup/SPIRV-Cross/archive/2019-04-26.tar.gz'
        'system-wide-SPIRV-Tools.patch')
md5sums=('SKIP'
         '844c06fc801d321e060fd761b56fc246'
         'cb97d62b263433cd5ee45cb3f3761a4d')

prepare() {
  rm -rf ${srcdir}/${_pkgname}/SPIRV-Cross
  mv ${srcdir}/SPIRV-Cross-* ${srcdir}/${_pkgname}/SPIRV-Cross
  patch ${srcdir}/${_pkgname}/genie.lua ${srcdir}/system-wide-SPIRV-Tools.patch
}

build() {
  cd ${srcdir}/${_pkgname}
  genie gmake
  make -C build config=release
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib
  cp ${srcdir}/${_pkgname}/bin/scopes ${pkgdir}/usr/bin/
  cp ${srcdir}/${_pkgname}/bin/libscopesrt.so ${pkgdir}/usr/lib/
  cp -r ${srcdir}/${_pkgname}/lib/* ${pkgdir}/usr/lib/
}

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
