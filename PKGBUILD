# Maintainer: Jorge Araya Navarro <jorge@esavara.cr>
pkgname=castledb-git
_pkgname=castle
pkgver=1.6.0.r81.g14519ad
pkgrel=2
pkgdesc="A structured database and level editor with a local web app to edit it"
arch=('i686' 'x86_64')
url="http://castledb.org/"
license=('ISC')
depends=('nwjs')
makedepends=('haxe' 'git')
provides=('castledb')
conflicts=('castledb')
source=(
  "${_pkgname}::git+https://github.com/ncannasse/${_pkgname}.git"
  "castledb"
  "org.castledb.CastleDB.desktop"
  "icon.png")
sha256sums=('SKIP'
            'c009cfcd1b8228e3eebcb1429527b7ce737e831ad763a4dfca84b8e84d5d4853'
            '7d72040daed6ad7f6bbc4d6c5639700a7621b075daad8ec1eacb137acb6e4595'
            'bb4abd65a9e89c1df66ae6c441bcffa67e200b812a1908240212799e6bf669fe')

pkgver() {
  cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"

  haxelib newrepo
  haxelib install --always --debug castle.hxml
}

build() {
  cd "$srcdir/${_pkgname}"

  haxe --verbose castle.hxml
  haxelib deleterepo
  # change the version displayed with that of this package
  sed -i "s/Version 1.5/Version ${pkgver}/g" "${srcdir}/${_pkgname}/bin/index.html"
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Ddm755 "${pkgdir}/usr/share/castledb"
  cp -r ./bin/{dock,libs,castle.js,icon.png,index.html,package.json,style.css} "${pkgdir}/usr/share/castledb/"

  install -D -m644 ./LICENSE "${pkgdir}"/usr/share/licenses/castledb/LICENSE
  install -Dm645 "$srcdir/castledb" "${pkgdir}/usr/bin/castledb"
  install -Dm644 "${srcdir}"/org.castledb.CastleDB.desktop "${pkgdir}"/usr/share/applications/castledb.desktop
  install -Dm644 "${srcdir}"/icon.png "${pkgdir}"/usr/share/pixmaps/castledb.png
}

# vim:set ts=2 sw=2 et:
