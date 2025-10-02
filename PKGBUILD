# Maintainer: Imawal
# Based on: protonmail-bridge-nokeychain & protonmail-bridge (AUR)
# Upstream fork: https://github.com/mnixry/proton-bridge

# AUR repo name is protonmail-bridge-free-nokeychain; its server hook requires
# pkgbase to match the repository name. We keep the shipped package with -git
# suffix by setting an explicit pkgbase and deriving pkgname from it.
pkgbase=protonmail-bridge-free-nokeychain
pkgname="${pkgbase}-git"
_pkgbase=proton-bridge
pkgver=3.21.2
pkgrel=6
# upstream_commit=11ecdd9
pkgdesc="Proton Mail Bridge fork (free) without keychain requirement; stores secrets in a file"
arch=(x86_64)
url="https://github.com/mnixry/proton-bridge"
license=(GPL3)
provides=(protonmail-bridge)
conflicts=(protonmail-bridge protonmail-bridge-core protonmail-bridge-nokeychain "${pkgbase}")
depends=()
makedepends=(git go)
source=("${_pkgbase}::git+https://github.com/mnixry/proton-bridge.git"
        "keyfile.patch"
        "protonmail-bridge.service")
sha256sums=('SKIP'
            '8417bf590a731aa207b055d0b5ee47468cfde0183b7f87ea501919748e27616f'
            '58668370a896fadffa69b2ec2d34660edc1e88338608c8a9516f1650350726a9')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  local internal_ver clean_ver
  internal_ver=$(grep -E '^BRIDGE_APP_VERSION\?=' Makefile | sed -E 's/^[^=]+= *([^ ]+).*/\1/' | head -n1)
  if [[ -z "${internal_ver}" ]]; then
    printf '0'
    return 0
  fi
  clean_ver="${internal_ver%%+*}"
  printf '%s' "${clean_ver}"
}

prepare() {
  cd "${srcdir}/${_pkgbase}"
  patch -Np1 --forward --input="${srcdir}/keyfile.patch"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make build-nogui BUILD_ENV="Arch Linux" || {
    echo "Falling back to bare go build..." >&2
    go build -v -buildvcs=false -o protonmail-bridge ./cmd/Desktop-Bridge/
  }
}

package() {
  cd "${srcdir}/${_pkgbase}"
  install -Dm755 protonmail-bridge "${pkgdir}/usr/bin/protonmail-bridge"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/protonmail-bridge.service" \
    "${pkgdir}/usr/lib/systemd/user/protonmail-bridge.service"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
