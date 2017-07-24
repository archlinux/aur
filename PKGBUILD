# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=gitfetch
pkgver=0.1.r2.g1f8fdaf
pkgrel=2
pkgdesc='Gitfetch performs git featch on multiple repositories, can be used as a daemon'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/gitfetch'
depends=()
makedepends=('go' 'glide')
source=("${pkgname}-${pkgver}::git+http://github.com/mikolajb/${pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Settgin GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  mkdir -p "${GOPATH}/src/github.com/mikolajb"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/mikolajb/gitfetch"
  cd "${GOPATH}/src/github.com/mikolajb/gitfetch"

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
