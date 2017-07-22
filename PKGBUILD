# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=4.4.1
pkgrel=2
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli')
license=('AGPL')
source=("git+https://github.com/ONLYOFFICE/DocumentServer.git#tag=ONLYOFFICE-DocumentServer-4.4.1")
sha512sums=("SKIP")

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd "${srcdir}/DocumentServer"
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/DocumentServer"

  export PATH="$srcdir/path:$PATH"

  # Download & build third party modules 
  cd core/Common/3dParty
  ./make.sh

  # Building core
  cd ../..
  make

  # Building sdkjs
  cd ../sdkjs
  make

  # Building server
  cd ../server
  make 
}

package() {
  cd "${srcdir}/DocumentServer"
  cd server
  make install
}
