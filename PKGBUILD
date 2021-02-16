# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Bram Swenson <bram+aur@craniumisajar.com>
# Contributor: Jaroslav Bojko <echo "Ym95amFyIGF0IHNlem5hbSBkb3QgY3oK" | base64 -d>

pkgname=amazon-ecr-credential-helper
pkgver=0.5.0
pkgrel=1
_commit=798bf2536dbe8a8d297e0b9ce5d61a8ef3df7775
pkgdesc="A credential helper for the Docker daemon that makes it easier to use Amazon EC2 Container Registry."
url='https://github.com/awslabs/amazon-ecr-credential-helper'
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('go')
_gourl=github.com/awslabs
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/awslabs/amazon-ecr-credential-helper/archive/v${pkgver}.tar.gz")
sha512sums=('db79a6e6e71df2c74f3018519713a33fef73fdbe18af8cf569fe54c78588f81ef4f0e05f9bfcb0f48b42853ac784e76c6bbcb648567e2eb3ccec1ce8a280fb4b')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  tar -zxvf "${pkgname}-${pkgver}.tar.gz" &> /dev/null
  mv -f "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_gourl}/${pkgname}"
  sed -i '/^GITFILES/d' "${srcdir}/src/${_gourl}/${pkgname}/Makefile"
  sed -i 's|GITCOMMIT_SHA: $(GITFILES)|GITCOMMIT_SHA:|' "${srcdir}/src/${_gourl}/${pkgname}/Makefile"
  sed -i "s|git rev-parse --short=7 HEAD|echo ${_commit}|" "${srcdir}/src/${_gourl}/${pkgname}/Makefile"
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make
}

package() {
  cd "${srcdir}/src/${_gourl}/${pkgname}/bin/local"
  install -Dm755 docker-credential-ecr-login \
                 "${pkgdir}/usr/bin/docker-credential-ecr-login"
}
