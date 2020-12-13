#Maintainer: fenugrec < @users.sourceforge.net>

#notes:
# - imagemagick required for extracting icon. Could use icoutils instead
# - arch : not tested on anything else, not sure if even possible.

_APP=EDSEditor
_pkgname=libedssharp
pkgname=libedssharp
pkgver=0.8
pkgrel=1
pkgdesc="A CanOpen EDS editor and library in C# with CanOpenNode export for Object Dictionary"
arch=('x86_64')
url="https://github.com/robincornelius/libedssharp"
license=('GPL')
depends=(mono)
makedepends=(mono-msbuild imagemagick)
#options=('!strip')
source=("${_pkgname}-${pkgver}.zip::https://github.com/robincornelius/libedssharp/archive/${pkgver}.zip"
	"${_APP}.desktop")

md5sums=('f8f2018f6135dce78e7c199180fabaee'
         '595dd0061e6f4bec0b8f620e1f4fff8e')


build() {
  cd "${_pkgname}-${pkgver}"

#their travis-CI thing does this
#  msbuild /p:Configuration=Release EDSEditor.sln
#but their makefile has
#  msbuild EDSEditorGUI
  make
  convert "Index_8287_16x.ico" "${_APP}.png"
}

package() {
  install -Dm644 "${_APP}.desktop" -t "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/lib/libedssharp/

  cd "${_pkgname}-${pkgver}"
  cp -Tr EDSTest/bin/Debug "$pkgdir"/usr/lib/libedssharp/
  install -Dm644 "${_APP}.png" -t "$pkgdir"/usr/share/pixmaps

}
