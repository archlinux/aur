# Maintainer: xsmile <sascha_r at gmx dot de>
_gitbranch='master'
_tools=('UEFIExtract' 'UEFIFind' 'UEFIPatch' 'UEFIReplace')
pkgname=uefitool-git
pkgver=r171.75225ec
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor, UEFIExtract, UEFIFind and UEFIPatch'
arch=('any')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git#branch=${_gitbranch}"
        'uefipatch.cpp.patch')
md5sums=('SKIP'
         '5c2df7cd74307fa46c13cd10159951da')

pkgver() {
  cd "${srcdir}/${pkgname%-git}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # pre-set the path to patches.txt in UEFIPatch
  patch -p1 -i "${srcdir}/uefipatch.cpp.patch"
}

build() {
  # uefitool
  cd "${srcdir}/${pkgname%-git}"
  qmake-qt5
  make
  # other tools
  for tool in "${_tools[@]}"; do
    cd "${srcdir}/${pkgname%-git}/${tool}"
    qmake-qt5
    make
  done
}

package() {
  # uefitool
  cd "${srcdir}/${pkgname%-git}"
  install -D -m755 "${url##*/}" "${pkgdir}/usr/bin/${pkgname%-git}"
  # other tools
  for tool in "${_tools[@]}"; do
    install -D -m755 "${tool}/${tool}" "${pkgdir}/usr/bin/${tool,,}"
  done
  # default patches.txt file
  install -D -m644 "${_tools[2]}/patches.txt" "${pkgdir}/usr/share/${pkgname%-git}/patches.txt"
}
