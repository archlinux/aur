# Maintainer: earthian <418@duck.com>

pkgname=goimapnotify-git
_pkgname=goimapnotify
pkgver=2.4.r2.gd3c5c6f
pkgrel=1
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=('git+https://gitlab.com/shackra/goimapnotify#branch=master')
sha256sums=('SKIP')
options=(!lto)

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$_pkgname"
  go build
}

check() {
  cd "$srcdir/$_pkgname"
  go test ./...
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 -t "${pkgdir}/usr/bin/" "$_pkgname"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" goimapnotify@.service
}
