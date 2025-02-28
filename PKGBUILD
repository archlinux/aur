# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Bram Swenson <bram+aur@craniumisajar.com>
# Contributor: Jaroslav Bojko <echo "Ym95amFyIGF0IHNlem5hbSBkb3QgY3oK" | base64 -d>

pkgname=amazon-ecr-credential-helper
pkgver=0.9.1
pkgrel=1
_commit=9cabe9aafd12c95cd51e6fb0847aaa2eecd957d7
pkgdesc="A credential helper for the Docker daemon that makes it easier to use Amazon EC2 Container Registry."
url='https://github.com/awslabs/amazon-ecr-credential-helper'
arch=('i686' 'x86_64' 'aarch64')
license=('Apache')
makedepends=('go')
_gourl=github.com/awslabs
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/awslabs/amazon-ecr-credential-helper/archive/v${pkgver}.tar.gz")
sha512sums=('bcadab06b3ae7c6cec0200e3522c1ec18729bef0d06cfe3aa489b2380be1e98336b050c693d632b495de492eadfb941fb3aa3eb01b71e3989fe8865b0d04c367')

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
