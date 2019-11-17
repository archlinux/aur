# Maintainer: Jonas Hahnfeld <hahnjo@hahnjo.de>

pkgname=dynconf
pkgver=1.1.1
pkgrel=1
pkgdesc="A small program to apply recipes to configuration files"
arch=('x86_64')
url="https://github.com/hahnjo/dynconf"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'dep' 'go-pie')
validpgpkeys=('5F0FF9606A4BE87F553A03B691C9C33D2C61ACDB')
source=("git+https://github.com/hahnjo/dynconf#tag=v${pkgver}?signed")
sha256sums=('SKIP')

prepare(){
  export GOPATH="${srcdir}/go"
  mkdir -p "${GOPATH}/src/github.com/hahnjo"
  ln -rTsf "${pkgname}" "${GOPATH}/src/github.com/hahnjo/${pkgname}"
}

build(){
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/github.com/hahnjo/${pkgname}"
  EXTRA_GOFLAGS="-trimpath -ldflags \"-extldflags ${LDFLAGS}\"" \
    make
}

package() {
  cd "${pkgname}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 scripts/completion.bash "$pkgdir"/usr/share/bash-completion/completions/$pkgname
}
