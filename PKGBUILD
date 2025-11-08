# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Bram Swenson <bram+aur@craniumisajar.com>
# Contributor: Jaroslav Bojko <echo "Ym95amFyIGF0IHNlem5hbSBkb3QgY3oK" | base64 -d>

pkgname=amazon-ecr-credential-helper
pkgver=0.11.0
pkgrel=1
_commit=9cabe9aafd12c95cd51e6fb0847aaa2eecd957d7
pkgdesc="A credential helper for the Docker daemon that makes it easier to use Amazon EC2 Container Registry."
url='https://github.com/awslabs/amazon-ecr-credential-helper'
arch=('i686' 'x86_64' 'aarch64')
license=('Apache')
makedepends=('go')
_gourl=github.com/awslabs
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/awslabs/amazon-ecr-credential-helper/archive/v${pkgver}.tar.gz")
sha512sums=('c19ec82e826612d439e6f30a18e1948056c7450bfda4ef71d7de7feb73523feb4285c51228560ab2e20450a7341f8fd83d93f7779d70950f0e5d53d1606117d1')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make
}

package() {
  cd "${srcdir}/src/${_gourl}/${pkgname}/bin/local"
  install -Dm755 docker-credential-ecr-login \
                 "${pkgdir}/usr/bin/docker-credential-ecr-login"
}
