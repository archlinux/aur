# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=pam_authelia-git
_pkgname=pam_authelia
pkgver=0.1.0.r0.g6c4af6f
pkgrel=1
pkgdesc="PAM module that delegates authentication (including 2FA) to an Authelia server."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/pam"
license=('Apache-2.0')
depends=('pam')
makedepends=(
  'gcc'
  'git'
  'go'
  'make'
)
provides=("${_pkgname}")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)

source=("${_pkgname}::git+https://github.com/authelia/pam.git#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="${srcdir}/gopath" PATH="${PATH}:${srcdir}/gopath/bin"
  cd "${srcdir}/${_pkgname}"

  local _version
  _version=$(git describe --tags --abbrev=0 | sed 's/^v//')

  CGO_ENABLED=0 go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags '-s -w' \
    -o "${_pkgname}" \
    ./cmd/pam_authelia

  make -C shim VERSION="${_version}" all
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "shim/${_pkgname}.so" "${pkgdir}/usr/lib/security/${_pkgname}.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
