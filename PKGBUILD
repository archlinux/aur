# Maintainer: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
pkgname=goimapnotify
pkgver=1.1
pkgrel=1
pkgdesc="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
arch=('i686' 'x86_64')
url="https://gitlab.com/shackra/goimapnotify"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://gitlab.com/shackra/goimapnotify/repository/v${pkgver}/archive.tar.gz"
        "goimapnotify@.service")
sha256sums=('366d30c926b4615e79d55871eac7c3ed744fbc1aa9bd82852e738faba34d3efd'
            'a6796c2b1ae3a03d096ad7755eaeb07ae33a5aa8ff32cca8b906fe0bbd67ba83')

prepare() {
  _dir=`find "$PWD" -iname "${pkgname}-v${pkgver}-*" -type d`
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
  install -D -m0644 ${srcdir}/goimapnotify@.service ${pkgdir}/usr/lib/systemd/system/goimapnotify@.service
}

# vim:set ts=2 sw=2 et:
