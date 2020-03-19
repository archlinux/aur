# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Bennett Piater <bennett at piater dot name>

pkgname=doctl
pkgver=1.39.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
arch=('i686' 'x86_64')
url='https://github.com/digitalocean/doctl'
license=('APACHE')
makedepends=('go' 'git')
conflicts=('doctl-bin')
source=("git+https://github.com/digitalocean/${pkgname}.git")

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout "v${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="${srcdir}/build"
  go get -t -d -v
  make native
}

check() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "builds/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install bash and zsh completions
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions/"
  install -d 755 "${pkgdir}/usr/share/zsh/site-functions/"
  ${pkgdir}/usr/bin/"${pkgname}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  ${pkgdir}/usr/bin/"${pkgname}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim: set et sw=2 sts=2:
sha256sums=('SKIP')
