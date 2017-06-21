# Maintainer: Bram Swenson <bram+aur@craniumisajar.com>

pkgname=amazon-ecr-credential-helper
pkgver=d33bfc419b3300614961ab30abe01548fd325258
pkgrel=1
pkgdesc="A credential helper for the Docker daemon that makes it easier to use Amazon EC2 Container Registry."
url='https://github.com/awslabs/amazon-ecr-credential-helper'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'godep' 'git')
_gourl=github.com/awslabs
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/awslabs/amazon-ecr-credential-helper/archive/${pkgver}.tar.gz")
sha512sums=('0e9baf4f631112c232d723faa83cdef1e7ca6f6a1ebd0335e353a0a68cfde9c798edcf566dd213d369cc141390283188b8c3b540c82fbbc7be61d5ab73a8e7a6')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  tar -zxvf "${pkgname}-${pkgver}.tar.gz" &> /dev/null
  mv -f "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_gourl}/${pkgname}"
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
