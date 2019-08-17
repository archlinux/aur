# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# Contributor: Bennett Piater <bennett at piater dot name>

pkgname=doctl
pkgver=1.28.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
arch=('i686' 'x86_64')
url='https://github.com/digitalocean/doctl'
license=('APACHE')
makedepends=('go' 'git')
conflicts=('doctl-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/digitalocean/${pkgname}/archive/v${pkgver}.tar.gz"
        "_build.sh.patch")
_build="release"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/_build.sh.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go get -t -d -v
  _version="${pkgver}" _build="${_build}" scripts/_build.sh
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/build"
  go test -x -v .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _pkgname=$(ls builds/ | grep "${pkgname}")
  install -Dm 755 "builds/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install bash and zsh completions
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions/"
  install -d 755 "${pkgdir}/usr/share/zsh/site-functions/"
  ${pkgdir}/usr/bin/"${pkgname}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  ${pkgdir}/usr/bin/"${pkgname}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim: set et sw=2 sts=2:
sha256sums=('eafb41457c4fb279762b1a81606130bd8f02f0390df77b032d11108666daff49'
            '7182de3afae4a991a6da43d58230f55e57839a55668d2b862d38186e7e7a366f')
