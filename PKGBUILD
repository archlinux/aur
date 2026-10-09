# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>

pkgname=docker-credential-pass
pkgver=0.9.10
pkgrel=1
pkgdesc='Store docker credentials using the Standard Unix Password Manager (pass)'
arch=(x86_64)
url='https://github.com/docker/docker-credential-helpers'
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl='github.com/docker/docker-credential-helpers'
source_x86_64=(
  "docker-credential-helpers-v${pkgver}.tar.gz::https://github.com/docker/docker-credential-helpers/archive/refs/tags/v0.9.10.tar.gz"
  'LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v0.9.10/LICENSE'
)
sha256sums_x86_64=(
  '547d0cb12c15faedced31487e6a456c63c0faa6e53895da076619733ef8917eb'
  'a6c2a5fdf40879f644bdb0da9042f245e7e263237d623264aafcf2470610ad8c'
)
noextract=('docker-credential-helpers-v${pkgver}.tar.gz')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  tar -x --strip-components=1 -C "${srcdir}/src/${_gourl}" -f "${srcdir}/docker-credential-helpers-v${pkgver}.tar.gz"
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
