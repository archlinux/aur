# Maintainer: Paul Goessmann <paul.goessmann@proton.me>
pkgname=pdrive
pkgver=0.1.0
pkgrel=1
pkgdesc='Proton Drive sync client with TUI for Linux (unofficial)'
arch=('x86_64' 'aarch64')
url='https://github.com/YourDoritos/pDrive'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go>=1.26' 'git')
install=pdrive.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

_srcdir="pDrive-${pkgver}"

prepare() {
  cd "${_srcdir}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${_srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _ldflags="-s -w -X main.version=${pkgver}"

  go build -ldflags "${_ldflags}" -o pdrive      ./cmd/pdrive
  go build -ldflags "${_ldflags}" -o pdrived     ./cmd/pdrived
  go build -ldflags "${_ldflags}" -o pdrivectl   ./cmd/pdrivectl
  go build -ldflags "${_ldflags}" -o pdrive-gate ./cmd/pdrive-gate

  # When the system Go is older than go.mod's directive (common with
  # mise/asdf overriding /usr/bin/go), the bootstrap downloads a toolchain
  # into the gopath modcache and marks the tree read-only. Yay's cleanup on
  # the next upgrade then fails with hundreds of "Permission denied"
  # warnings. GOFLAGS=-modcacherw does not cover the toolchain bootstrap, so
  # force the tree writable here instead. (Same fix as pVPN.)
  if [[ -d "${srcdir}/gopath" ]]; then
    chmod -R u+w "${srcdir}/gopath" || true
  fi
}

package() {
  cd "${_srcdir}"
  install -Dm755 pdrive      "${pkgdir}/usr/bin/pdrive"
  install -Dm755 pdrived     "${pkgdir}/usr/bin/pdrived"
  install -Dm755 pdrivectl   "${pkgdir}/usr/bin/pdrivectl"
  install -Dm755 pdrive-gate "${pkgdir}/usr/bin/pdrive-gate"

  # pdrived is a user service: it runs as you, not root.
  sed 's|ExecStart=/usr/local/bin/pdrived|ExecStart=/usr/bin/pdrived|' \
    dist/pdrived.service | install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/systemd/user/pdrived.service"

  # pdrive-gate is a system service and is optional; it is installed but not
  # enabled. Nothing else in pDrive needs root.
  sed 's|ExecStart=/usr/local/bin/pdrive-gate|ExecStart=/usr/bin/pdrive-gate|' \
    dist/pdrive-gate.service | install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/systemd/system/pdrive-gate.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 SECURITY.md "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
}
