# Maintainer: xsmile <sascha_r at gmx dot de>

pkgname=uefitool-git
_pkgname=uefitool
_tools=('UEFIExtract' 'UEFIFind' 'UEFIPatch' 'UEFIReplace')
pkgver=r171.75225ec
pkgrel=2
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('any')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}.git"
        'uefipatch.cpp.patch')
md5sums=('SKIP'
         '5c2df7cd74307fa46c13cd10159951da')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # pre-set the path to patches.txt in UEFIPatch
  patch -p1 -i "$srcdir/uefipatch.cpp.patch"
}

_build() {
  qmake QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
  make
}

build() {
  # UEFITool
  cd "$srcdir/$_pkgname"
  _build
  # Other tools
  for tool in "${_tools[@]}"; do
    cd "$srcdir/$_pkgname/$tool"
    _build
  done
}

package() {
  # UEFITool
  cd "$srcdir/$_pkgname"
  install -D -m755 UEFITool "$pkgdir/usr/bin/$_pkgname"
  # Other tools
  for tool in "${_tools[@]}"; do
    install -D -m755 "$tool/$tool" "$pkgdir/usr/bin/${tool,,}"
  done
  # Install patches.txt to pre-set path
  install -D -m644 UEFIPatch/patches.txt "$pkgdir/usr/share/$_pkgname/patches.txt"
  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
