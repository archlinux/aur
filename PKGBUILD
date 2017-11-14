# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=gitfetch
pkgver=0.3
pkgrel=1
pkgdesc='Gitfetch performs git featch on multiple repositories, can be used as a daemon'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/gitfetch'
depends=()
makedepends=('go' 'glide')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1e1aa639c092ba0670f7037fbcf2835ee598e973a3f7f86fdf3679589bfda13f')

build() {
  msg2 'Settgin GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${srcdir}/gopath"
  export GOPATH="${srcdir}/gopath"

  msg2 'Getting go dep tool'
  go get github.com/golang/dep/cmd/dep

  mkdir -p "${GOPATH}/src/github.com/mikolajb"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/mikolajb/${pkgname}"
  cd "${GOPATH}/src/github.com/mikolajb/${pkgname}"

  msg2 'Fetching dependencies...'
  "$GOPATH/bin/dep" ensure

  msg2 'Compiling...'
  go build -o gitfetch
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/gitfetch ${pkgdir}/usr/bin/gitfetch
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitfetch.service ${pkgdir}/usr/lib/systemd/user/gitfetch.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitfetch.timer ${pkgdir}/usr/lib/systemd/user/gitfetch.timer
}
