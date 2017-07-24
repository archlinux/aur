# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=gitfetch
pkgver=0.2
pkgrel=1
pkgdesc='Gitfetch performs git featch on multiple repositories, can be used as a daemon'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/gitfetch'
depends=()
makedepends=('go' 'glide')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mikolajb/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1e8c02a38ab000f722318dfe0949bcc59ff7a847e0e414ed6fba0a53cefcb295')

build() {
  msg2 'Settgin GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  mkdir -p "${GOPATH}/src/github.com/mikolajb"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/mikolajb/${pkgname}"
  cd "${GOPATH}/src/github.com/mikolajb/${pkgname}"

  msg2 'Fetching dependencies...'
  glide install

  msg2 'Compiling...'
  go build -o gitfetch
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/gitfetch ${pkgdir}/usr/bin/gitfetch
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitfetch.service ${pkgdir}/usr/lib/systemd/user/gitfetch.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitfetch.timer ${pkgdir}/usr/lib/systemd/user/gitfetch.timer
}
