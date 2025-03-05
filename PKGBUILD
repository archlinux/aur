# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>

pkgname=docker-credential-pass
pkgver=0.9.2
pkgrel=1
pkgdesc='Store docker credentials using the Standard Unix Password Manager (pass)'
arch=(x86_64)
url='https://github.com/docker/docker-credential-helpers'
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl='github.com/docker/docker-credential-helpers'
source_x86_64=(
  'docker-credential-helpers-v0.9.2.tar.gz::https://github.com/docker/docker-credential-helpers/archive/refs/tags/v0.9.2.tar.gz'
  'LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v0.9.2/LICENSE'
)
sha256sums_x86_64=(
  'bdad4f712244f11dc64890db2f915166306bb4b040149f4497c31f33c7a87327'
  'a6c2a5fdf40879f644bdb0da9042f245e7e263237d623264aafcf2470610ad8c'
)
noextract=('docker-credential-helpers-v0.9.2.tar.gz')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  tar -x --strip-components=1 -C "${srcdir}/src/${_gourl}" -f "${srcdir}/docker-credential-helpers-v0.9.2.tar.gz"
}

build() {
  cd "${srcdir}/src/${_gourl}"
  GO111MODULE=off GOPATH="${srcdir}" go install -v -x ./credentials
  GO111MODULE=off GOPATH="${srcdir}" make pass
}

package() {
  cd "${srcdir}/src/${_gourl}"
  install -D -m 0755 bin/build/docker-credential-pass "${pkgdir}/usr/bin/docker-credential-pass"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
