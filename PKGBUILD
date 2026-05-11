# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=pam_authelia
pkgver=0.1.1
pkgrel=1
pkgdesc="PAM module that delegates authentication (including 2FA) to an Authelia server."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/pam"
license=('Apache-2.0')
depends=('pam')
makedepends=(
  'gcc'
  'go'
  'make'
)
conflicts=(
  'pam_authelia-bin'
  'pam_authelia-git'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/authelia/pam/archive/v${pkgver}.tar.gz")

sha256sums=('af9542ea1ade603dcd3ef697e5fd01457317e4fec3151124c6a361c023e6bcfa')

build() {
  export GOPATH="${srcdir}/gopath" PATH="${PATH}:${srcdir}/gopath/bin"
  cd "${srcdir}/pam-${pkgver}"

  CGO_ENABLED=0 go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags '-s -w' \
    -o "${pkgname}" \
    ./cmd/pam_authelia

  make -C shim VERSION="${pkgver}" all
}

package() {
  cd "${srcdir}/pam-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "shim/${pkgname}.so" "${pkgdir}/usr/lib/security/${pkgname}.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
