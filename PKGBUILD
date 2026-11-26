# Maintainer: Yakov Till <yakov.till@gmail.com>

# blaze here is the Rust build engine. Official extra/blaze and AUR blaze-git are the unrelated
# C++ math library (blaze-lib); extra/blaze is header-only and installs no executables, so
# /usr/bin/blaze is free and this package neither provides nor conflicts with `blaze`.
pkgname=blaze-bin
pkgver=0.20261122.0
pkgrel=1
pkgdesc="Incremental Rust build engine that rebuilds only what an edit changed"
arch=('x86_64' 'aarch64')
url="https://github.com/indexable-inc/blaze"
# upstream licenses every release under either
license=('Apache-2.0' 'MIT')
# blaze links every program by running `cc`, and without one the link fails after the
# objects are built; gcc is what provides /usr/bin/cc
depends=('gcc')
provides=('blaze-engine')
conflicts=('blaze-engine')
# prebuilt binaries: a debug split would only carry someone else's debug info
options=('!debug')

# spelled out per architecture rather than with $CARCH: .SRCINFO records what the current build
# host expanded, so $CARCH would put the x86_64 file into source_aarch64. The aarch64 sum is from
# the release's published SHA256SUMS, the only way to have it on an x86_64 build host
source_x86_64=("blaze-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/indexable-inc/blaze/releases/download/v${pkgver}/blaze-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("blaze-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/indexable-inc/blaze/releases/download/v${pkgver}/blaze-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('45d5e42537f84a02146921f5dc8ad6ee0bea4db3cba610e597f8daef2ae0e1c9')
sha256sums_aarch64=('f6be8678acd5d471c13a8d473f14cbb50daf978ad9e3a90845377d10797084de')

# Releases are dated, 0.YYYYMMDD.N, and land on the canary channel first as GitHub
# prereleases: /releases/latest is the newest one that passed the heavy tests
latestver() {
  gh api repos/indexable-inc/blaze/releases/latest --jq .tag_name |
    sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p'
}

package() {
  local _dir="blaze-v${pkgver}-${CARCH}-unknown-linux-gnu"

  # Upstream's release now ships one self-contained executable. cargo installs
  # expose that same program as blaze-engine as well.
  install -Dm755 "${_dir}/blaze" "${pkgdir}/usr/bin/blaze"
  ln -s blaze "${pkgdir}/usr/bin/blaze-engine"

  install -Dm644 "${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${_dir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "${_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

check() {
  local _dir="blaze-v${pkgver}-${CARCH}-unknown-linux-gnu"
  local _got
  _got=$("${srcdir}/${_dir}/blaze" --version | awk '{print $2}')
  [[ $_got == "$pkgver" ]] || { error "blaze reports $_got, expected $pkgver"; return 1; }
}
