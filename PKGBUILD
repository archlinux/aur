# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
pkgname=docker-credential-pass-git
pkgver=0.7.0.r0.ac5992b
pkgrel=1
pkgdesc="Store docker credentials using the Standard Unix Password Manager (pass)"
arch=('x86_64')
_gourl="github.com/docker/docker-credential-helpers"
url="https://${_gourl}"
license=('MIT')
groups=()
depends=('pass')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("docker-credential-helpers::git+https://${_gourl}#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/docker-credential-helpers"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare() {
  mkdir -p "${srcdir}/src/$(dirname ${_gourl})"
  ln -sf "${srcdir}/docker-credential-helpers" "${srcdir}/src/${_gourl}"
}

build() {
  cd "${srcdir}/src/${_gourl}"
  GOPATH="${srcdir}" make pass
}

package() {
  cd "${srcdir}/src/${_gourl}"
  install -D -m 0755 bin/build/docker-credential-pass "${pkgdir}/usr/bin/docker-credential-pass"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
