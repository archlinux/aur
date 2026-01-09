# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>

pkgname=docker-credential-pass
pkgver=0.9.5
pkgrel=1
pkgdesc='Store docker credentials using the Standard Unix Password Manager (pass)'
arch=(x86_64)
url='https://github.com/docker/docker-credential-helpers'
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl='github.com/docker/docker-credential-helpers'
source_x86_64=(
  'docker-credential-helpers-v0.9.5.tar.gz::https://github.com/docker/docker-credential-helpers/archive/refs/tags/v0.9.5.tar.gz'
  'LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v0.9.5/LICENSE'
)
sha256sums_x86_64=(
  '7f2e5ed5e9c9c483288a227692b70abe283bdf78b0abc36d0846704bb6d82c94'
  'a6c2a5fdf40879f644bdb0da9042f245e7e263237d623264aafcf2470610ad8c'
)
noextract=('docker-credential-helpers-v0.9.5.tar.gz')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  tar -x --strip-components=1 -C "${srcdir}/src/${_gourl}" -f "${srcdir}/docker-credential-helpers-v0.9.5.tar.gz"
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
