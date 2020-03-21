# Maintainer: das_kube
pkgname='esy'
pkgver='0.6.2'
arch=('i686' 'x86_64')
pkgrel='1'
pkgdesc="package manager for OCaml/Reason"
url="https://esy.sh/"
license=('custom')
depends=('bash' 'gcc-libs')
makedepends=('npm>=6.9')

prepare() {
  # directory for node_modules
  mkdir -p snapshot
  cd snapshot/
  npm init -y > /dev/null 2> /dev/null
  npm install "esy@${pkgver}" --no-scripts
}

build() {
  # magic script to invoke the actual esy binary
  echo > esy.sh '#!/bin/sh
exec /opt/esy/node_modules/esy/_build/default/bin/esy.exe $@
'

  # cleanup
  find snapshot -type d \( -name 'platform-linux' -or -name 'platform-darwin' \
    -or -name  'platform-windows' -or -name 'platform-win32' \) -exec rm -rf {} \; -prune
  find snapshot -name '*.exe' -exec chmod a+x {} \; 
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/"
  install -Dm755 esy.sh "$pkgdir/usr/bin/esy"
  cp -r snapshot/ "$pkgdir/opt/esy"
}
