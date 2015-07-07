# Maintainer: Vincent Petithory <vincent.petithory at gmail dot com>

pkgname=camlistore-git
pkgver=r4761.0757937
pkgrel=1
pkgdesc='Camlistore is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era.'
arch=('x86_64' 'i686' 'ARM')
url='https://camlistore.org/'
license=('Apache')
makedepends=('go' 'git')
conflicts=('camlistore')
depends=('sqlite')
optdepends=('mongodb: as indexer database'
  'postgresql: as indexer database'
  'mariadb: as indexer database')
options=('!strip' '!emptydirs')
install=camlistore.install
source=('git+https://camlistore.googlesource.com/camlistore'
  'camlistore.service')
md5sums=('SKIP'
         '0ff93108daf98c38c7fc6fdd64d42236')

pkgver() {
  cd "$srcdir/camlistore"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/camlistore"
  go run make.go
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" "${srcdir}"/camlistore/bin/{camget,camlistored,cammount,camput,camtool} 
  
  install -D -m644 "${srcdir}/camlistore.service" "${pkgdir}/usr/lib/systemd/system/camlistore.service"
}
