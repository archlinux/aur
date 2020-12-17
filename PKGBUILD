# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=muserv-git
_pkgname=muserv
pkgver=v0.1.27.pre
pkgrel=1
pkgdesc="muserv (DLNA/UPnP server for music)"
arch=(any)
url="https://$_pkgorg/$_pkgname/"
license=('GPL3')
depends=(
  mailcap
)
makedepends=(
    git
    go-pie
)
source=("git+https://$_pkgorg/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/$_pkgorg
  ln -rTsf $_pkgname gopath/src/$_pkgorg/$_pkgname
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
  make VERSION=$pkgver
}

package() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
  make DESTDIR="$pkgdir" install
  cd -

  cd $_pkgname
  ls -al
  install -Dm0644 systemd/muserv.service "$pkgdir"/etc/systemd/system/muserv.service
  install -Dm0644 cfg/sysusers.conf "$pkgdir"/usr/lib/sysusers.d/muserv.conf
  install -Dm0644 cfg/config-default.json "$pkgdir"/etc/muserv/config-default.json
  install -Dm0644 cfg/ContentDirectory.xml "$pkgdir"/etc/muserv/ContentDirectory.xml
  install -Dm0644 cfg/ConnectionManager.xml "$pkgdir"/etc/muserv/ConnectionManager.xml
}
