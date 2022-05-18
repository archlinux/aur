# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: denisse https://github.com/da-edra (original PKGBUILD author from teleirc)
pkgname=teleirc-git
_pkgname=teleirc
pkgdesc='Go implementation of a Telegram <=> IRC bridge for use with any IRC channel and Telegram group.'
arch=(any)
url='https://github.com/RITlug/teleirc'
_branch='main'
pkgver=v2.2.0.r14.g8dac678
pkgrel=1
license=('GPL3')
makedepends=(go)
source=("git+https://github.com/ritlug/teleirc.git")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ cmd/$_pkgname.go
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "${srcdir}/${_pkgname}/deployments/systemd/teleirc.sysusers" "${pkgdir}/usr/lib/sysusers.d/teleirc.conf"
  install -Dm644 "${srcdir}/${_pkgname}/deployments/systemd/teleirc@.service" "${pkgdir}/usr/lib/systemd/system/teleirc@.service"
  install -Dm644 "${srcdir}/${_pkgname}/deployments/systemd/teleirc.tmpfiles" "${pkgdir}/etc/tmpfiles.d/teleirc.conf"
  install -Dm644 "${srcdir}/${_pkgname}/env.example" "${pkgdir}/etc/teleirc/example"
}

