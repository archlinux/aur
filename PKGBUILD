# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

_pkgname=gopass
_gourl="github.com/justwatchcom"
pkgname=gopass-git
pkgver=r24.bddd1e0
pkgrel=1
pkgdesc="The slightly more awesome standard unix password manager for teams."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/justwatchcom/gopass"
license=('MIT')
depends=('bash' 'git' 'gnupg' 'xclip')
makedepends=('go>=1.7' 'git' 'make')
provides=("gopass=${pkgver}")
source=('git://github.com/justwatchcom/gopass.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/go/src/${_gourl}/${_pkgname}"
  mv "${srcdir}/${_pkgname}" "${srcdir}/go/src/${_gourl}"

  export GOPATH="$srcdir/go"

  cd ${srcdir}/go/src/${_gourl}/${_pkgname}
  LDFLAGS='' make build
}

package() {
  export GOOS=$(go version | cut -d' ' -f4 | cut -d'/' -f1)
  export GOARCH=$(go version | cut -d' ' -f4 | cut -d'/' -f2)
  install -Dm755 "${srcdir}/go/src/${_gourl}/${_pkgname}/${_pkgname}-${GOOS}-${GOARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}
