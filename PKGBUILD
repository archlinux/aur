# Maintainer: Imawal
# Based on: protonmail-bridge-nokeychain & protonmail-bridge (AUR)
# Upstream fork: https://github.com/mnixry/proton-bridge

# AUR repo name is protonmail-bridge-free-nokeychain; its server hook requires
# pkgbase to match the repository name. We keep the shipped package with -git
# suffix by setting an explicit pkgbase and deriving pkgname from it.
pkgbase=protonmail-bridge-free-nokeychain
pkgname="${pkgbase}-git"
_pkgbase=proton-bridge
pkgver=3.21.2.r0.g7d1e9135
pkgrel=5
pkgdesc="Proton Mail Bridge fork (free) without keychain requirement; stores secrets in a file"
arch=(x86_64)
url="https://github.com/mnixry/proton-bridge"
license=(GPL3)
provides=(protonmail-bridge)
conflicts=(protonmail-bridge protonmail-bridge-core protonmail-bridge-nokeychain "${pkgbase}")
depends=()
makedepends=(git go)
options=(!strip)
source=("${_pkgbase}::git+https://github.com/mnixry/proton-bridge.git"
        "keyfile.patch"
        "protonmail-bridge.service")
sha256sums=('SKIP'
            '8417bf590a731aa207b055d0b5ee47468cfde0183b7f87ea501919748e27616f'
            '58668370a896fadffa69b2ec2d34660edc1e88338608c8a9516f1650350726a9')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  local internal_ver
  internal_ver=$(grep -E 'BRIDGE_APP_VERSION\?=' Makefile | sed -E 's/.*= *([^ ]+).*/\1/' )
  local git_rev
  git_rev=$(git rev-parse --short HEAD)
  printf '%s.r0.g%s' "${internal_ver%%+*}" "${git_rev}"
}

prepare() {
  cd "${srcdir}/${_pkgbase}"
  patch -p1 -N < "${srcdir}/keyfile.patch" || true
}

build() {
  cd "${srcdir}/${_pkgbase}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  make build-nogui BUILD_ENV="Arch Linux" || {
    echo "Falling back to bare go build..." >&2
    go build -v -buildvcs=false -o bridge ./cmd/Desktop-Bridge/
  }
}

package() {
  cd "${srcdir}/${_pkgbase}"
  install -Dm755 bridge "${pkgdir}/usr/bin/protonmail-bridge"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/protonmail-bridge.service" \
    "${pkgdir}/usr/lib/systemd/user/protonmail-bridge.service"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 Changelog.md "${pkgdir}/usr/share/doc/${pkgname}/Changelog.md" || true
}