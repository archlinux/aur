# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgname=docker-credential-vault-login
pkgdesc='Docker Credential Helper for Vault-stored Credentials'
pkgver=0.3.47
pkgrel=2
_commit='ee4808152406c315faa5e78281ab93b97eb2c218'
arch=('x86_64')
url='https://github.com/morningconsult/docker-credential-vault-login'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
optdepends=(
  'docker: For utilizing this cred helper'
)
backup=("etc/$pkgname/config.hcl")
source=(
  "${pkgname}-${pkgver}::https://github.com/morningconsult/docker-credential-vault-login/archive/refs/tags/v${pkgver}.tar.gz"
  'config.hcl'
)
sha256sums=('be5f962a590b4390cf6e107677872767be99e254e5b0bee49777f01a86826436'
            'e5fe56a4b9000033ce8e228c4768f408b5c238b3a73343310516aabb29a64261')

prepare() {
  cd "${pkgname}-${pkgver}"

  # download dependencies
  export GOPATH="${srcdir}"
  export GOFLAGS="-mod=readonly -modcacherw -buildmode=pie"

  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-mod=readonly -modcacherw -buildmode=pie"

  ./scripts/build-binary.sh \
    "v${pkgver}" \
    "${_commit}" \
    "github.com/morningconsult/docker-credential-vault-login"
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "./bin/$pkgname"

  # configuration & docs
  install -Dm755 "${srcdir}/config.hcl" "${pkgdir}/etc/${pkgname}/config.hcl"
  install -Dm755 -d "${pkgdir}/var/lib/${pkgname}"
  install -Dm755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  sed -n '/^## Setup/,/^## Demonstration/p' ./README.md \
    | head --lines=-2 \
    > "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

