# Maintainer: Denis Lobanov <denis dot lobanov at zooei dot com>
pkgname=bloomrpc
pkgver=1.2.1
pkgrel=1
pkgdesc="GUI Client for GRPC Services"
arch=(any)
url="https://github.com/fenos/bloomrpc"
license=(LGPL3)
depends=('gtk3' 'gconf' 'libxss' 'libxtst')
makedepends=('nodejs' 'npm'  'clang' 'git' 'yarn')
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/uw-labs/bloomrpc.git#tag=v$pkgver"
        "${pkgname}.desktop")
sha1sums=('SKIP'
          'f050f42f2faedfb0df2da3e7afdaef42716a34ff')

prepare() {
  cd "${pkgname}"
  sed -i '/_where/d' package.json
}

build() {
  cd "${pkgname}"

  yarn
  CXX=clang++ CC=clang ./node_modules/.bin/electron-rebuild
  npm --cache "${srcdir}/npm-cache" run package-linux
}

package() {
  cd "${pkgname}"

  install -dm755 "${pkgdir}/opt/BloomRPC"
  cp -rd release/linux-unpacked/* "${pkgdir}/opt/BloomRPC/"

  cd resources/icons
  for i in $(ls *.png)
  do 
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${i%.png}"
    install -Dm644  $i "$pkgdir/usr/share/icons/hicolor/${i%.png}/"
  done

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
