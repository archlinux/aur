# Maintainer: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
pkgname=goimapnotify
pkgver=2.0
pkgrel=4
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
arch=('i686' 'x86_64')
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://gitlab.com/shackra/goimapnotify/repository/${pkgver}/archive.tar.gz"
        "goimapnotify@.service")
sha256sums=('9a241d12a5b4cae12fe3d0b0bc5d376da228934f7f344d012e213ac184970471'
            'fad87eddc39f8ba2f7637024de96238cd9d5b0a7ce271ce75062127be74c1d0b')

prepare() {
  _dir=`find "$PWD" -iname "${pkgname}-${pkgver}-*" -type d`
  rm -rf "${srcdir}/src"
  mkdir -p "$srcdir"/src/gitlab.com/shackra/
  ln -sf $_dir "$srcdir"/src/gitlab.com/shackra/goimapnotify
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin
  cd "$GOPATH"/src/gitlab.com/shackra/goimapnotify
  go get .
}

package() {
  cd "${srcdir}"
  install -Dm755 "./bin/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "src/gitlab.com/shackra/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m0644 ${srcdir}/goimapnotify@.service ${pkgdir}/usr/lib/systemd/user/goimapnotify@.service
}

# vim:set ts=2 sw=2 et:
