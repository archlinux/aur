pkgname=libctru-fixed-git
_gitname=ctrulib
_libname=libctru
pkgver=9999999999
pkgrel=1
pkgdesc="Library for Nintendo 3DS homebrew development"
arch=('any')
url="https://github.com/smealum/ctrulib"
license=('custom: zlib')
depends=('devkitarm')
makedepends=('git')
provides=('libctru' 'libctru-git')
conflicts=('libctru' 'libctru-git')
source=('ctrulib::git://github.com/smealum/ctrulib')
md5sums=('SKIP')
options=(staticlibs !strip)

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  source /etc/profile.d/devkitarm.sh
  make -j $(nproc) -C "${srcdir}/${_gitname}/${_libname}"
}

package() {
  cd "${srcdir}/${_gitname}"

  export DEVKITPRO="${pkgdir}/opt/devkitpro"
  make -C "${_libname}" install

  # license
  install -d "${pkgdir}"/usr/share/licenses/${_libname}
  sed '/license/,$!d' README.md > "${pkgdir}/usr/share/licenses/${_libname}/LICENSE"
}
