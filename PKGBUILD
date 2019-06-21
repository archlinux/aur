# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Bennett Piater <bennett at piater dot name>

pkgname=doctl
pkgver=1.20.1
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
arch=('i686' 'x86_64')
url='https://github.com/digitalocean/doctl'
license=('APACHE')
makedepends=('go' 'git')
conflicts=('doctl-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/digitalocean/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go get -t -d -v
  make native
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go test -x -v .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "builds/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install bash and zsh completions
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions/"
  install -d 755 "${pkgdir}/usr/share/zsh/site-functions/"
  ${pkgdir}/usr/bin/"${pkgname}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  ${pkgdir}/usr/bin/"${pkgname}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim: set et sw=2 sts=2:
sha256sums=('bfd0209ab6a10ace41d17608f546a19e806c92f818be2ed0d4bfe8ab256c8a69')
