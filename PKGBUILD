# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=timoni
pkgver=0.20.0
pkgrel=1
pkgdesc="Timoni is a package manager for Kubernetes, powered by CUE and inspired by Helm."
arch=('x86_64')
url="https://github.com/stefanprodan/timoni"
conflicts=('timoni-bin')
provides=('timoni')
license=('Apache 2')
makedepends=('go>=1.21' 'make' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef8fc731d551e952c2a18bbedd5dee714e0971cbb1ef61926a005f393c0887b4')

build() {
	cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  sed -i 's/$(DEV_VERSION)/'${pkgver}'/g' Makefile

  make build
  make docs
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 bin/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  cp -R docs examples ${pkgdir}/usr/share/doc/${pkgname}/
}
