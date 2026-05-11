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

sha256sums=('c972bc794eb45e3aeffafe8e148f3d1cfa1a188d21af05cd3e7f9a40444fec67')

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
