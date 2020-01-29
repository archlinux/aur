# Maintainer: Denis Lobanov <first name dot last name at zooei dot com>
pkgname=bloomrpc
pkgver=1.4.1
pkgrel=1
pkgdesc="GUI Client for gRPC Services"
arch=(any)
url="https://github.com/uw-labs/bloomrpc"
license=(LGPL3)
depends=('gtk3' 'gconf' 'libxss' 'libxtst')
makedepends=('nodejs' 'npm'  'clang' 'git' 'yarn')
source=("${pkgname}::git+https://github.com/uw-labs/bloomrpc.git#tag=${pkgver//_/-}"
        "${pkgname}.desktop")
sha1sums=('SKIP'
          'f050f42f2faedfb0df2da3e7afdaef42716a34ff')

prepare() {
  cd "${pkgname}"
  sed -i '/_where/d' package.json
}

build() {
  cd "${pkgname}"
  export CXX=clang++
  export CC=clang

  yarn
  ./node_modules/.bin/electron-rebuild
  npm --cache "${srcdir}/npm-cache" run package-linux
}

package() {
  cd "${pkgname}"

  install -dm755 "${pkgdir}/opt/BloomRPC"
  cp -rd release/linux-unpacked/* "${pkgdir}/opt/BloomRPC/"

  cd resources/icons
  for i in $(ls *.png)
  do 
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/"
    install -Dm644  $i "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/bloomrpc.png"
  done

  mkdir -p $pkgdir/usr/local/bin
  ln -sf /opt/BloomRPC/bloomrpc $pkgdir/usr/local/bin/bloomrpc
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
