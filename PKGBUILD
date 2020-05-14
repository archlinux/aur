# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgname=scopes
pkgname=${_pkgname}-hg
pkgver=r2177+.e99ac8ce1ce7+
pkgrel=2
pkgdesc="Scopes is a retargetable programming language & infrastructure"
url="https://scopes.rocks"
arch=('x86_64')
license=('MIT')
depends=('clang' 'spirv-tools')
makedepends=('mercurial' 'llvm' 'genie-git' 'make' 'cmake' 'spirv-headers')
conflicts=('scopes')
provides=('scopes')

source=('hg+https://hg.sr.ht/~duangle/scopes'
        'SPIRV-Cross.tar.gz::https://github.com/KhronosGroup/SPIRV-Cross/archive/2020-04-03.tar.gz'
        'platform.patch')
md5sums=('SKIP'
         '565918e1380ad47c402a542ae7a5e630'
         '1d932ff8891475446941ee5ec9b53734')

prepare() {
  rm -rf "${srcdir}/${_pkgname}"/SPIRV-Cross
  mv "${srcdir}"/SPIRV-Cross-* "${srcdir}/${_pkgname}"/SPIRV-Cross
  patch -d "${srcdir}/${_pkgname}" -p1 <"${srcdir}"/platform.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  genie gmake
  make -C build config=release
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/lib
  cp "${srcdir}/${_pkgname}"/bin/scopes "${pkgdir}"/usr/bin/
  cp "${srcdir}/${_pkgname}"/bin/libscopesrt.so "${pkgdir}"/usr/lib/
  cp -r "${srcdir}/${_pkgname}"/lib/* "${pkgdir}"/usr/lib/
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
