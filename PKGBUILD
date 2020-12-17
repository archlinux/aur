#Maintainer: fenugrec < @users.sourceforge.net>

#notes:
# - imagemagick required for extracting icon. Could use icoutils instead
# - arch : not tested on anything else, not sure if even possible.

_APP=EDSEditor
_pkgname=libedssharp
pkgname=libedssharp-git
pkgver=r526.6f67539
pkgrel=1
pkgdesc="A CanOpen EDS editor and library in C# with CanOpenNode export for Object Dictionary"
arch=('x86_64')
url="https://github.com/robincornelius/libedssharp"
license=('GPL')
depends=(mono)
makedepends=(mono-msbuild imagemagick nuget)
provides=(libedssharp)
conflicts=(libedssharp)
#options=('!strip')
source=("${_pkgname}::git+https://github.com/robincornelius/libedssharp"
	"${_APP}.desktop"
	"${_APP}")

md5sums=('SKIP'
         '3c72fa86610e8c060cc705d3d9596005'
         'b72a9a5f5ba46e881c20cebb5107fed6')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

#their travis-CI thing does this
  nuget restore
  msbuild /p:Configuration=Release EDSEditor.sln
#but their makefile has
#  msbuild EDSEditorGUI

  convert "Index_8287_16x.ico" "${_APP}.png"
}

package() {
  install -Dm644 "${_APP}.desktop" -t "$pkgdir"/usr/share/applications
  install -Dm755 "${_APP}" -t "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/libedssharp/

  cd "${_pkgname}"
  cp -Tr EDSEditorGUI/bin/Release "$pkgdir"/usr/lib/libedssharp/
  install -Dm644 "${_APP}.png" -t "$pkgdir"/usr/share/pixmaps

}
