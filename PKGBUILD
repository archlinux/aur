# Maintainer: robertfoster

pkgname=openbazaard
pkgver=0.14.6
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-go"
license=('MIT')
makedepends=(go)
_org=github.com/OpenBazaar
_repo=openbazaar-go
source=("https://github.com/OpenBazaar/openbazaar-go/archive/v${pkgver}.tar.gz"
  "$pkgname.service"
  "$pkgname.conf"
  "$pkgname.sysuser.conf"
)

prepare() {
  cd "$srcdir"
  mkdir -p "src/${_org}"
  if [ ! -e "src/${_org}/${_repo}" ]; then
    ln -sf "${srcdir}/${_repo}-${pkgver}" "src/${_org}/${_repo}"
  fi
}

build() {
  cd "${srcdir}"/src/${_org}/${_repo}
  export GOPATH="$srcdir"
  go get -v
  GOFLAGS="-buildmode=pie -trimpath -modcacherw" \
    go build -ldflags="-s -w" 
}

package() {
  install -Dm755 "$srcdir/bin/${_repo}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"
  install -Dm755 "$srcdir/$pkgname.sysuser.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

md5sums=('12369c12445f9a234863816c584d81d2'
         'ae3e285b857b7efeecbab29826f29735'
         '9fd31f8bc5b6ccc21a52fc1b58fdb9d6'
         '92cd2fa8929c5acddbddf7d4fc2fd494')
