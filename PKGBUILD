# Maintainer: Yakov Till <yakov.till@gmail.com>

# blaze here is the Rust build engine. Official extra/blaze and AUR blaze-git are the unrelated
# C++ math library (blaze-lib); extra/blaze is header-only and installs no executables, so
# /usr/bin/blaze is free and this package neither provides nor conflicts with `blaze`.
pkgname=blaze-bin
pkgver=0.20261027.0
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
sha256sums_x86_64=('df61ce6d8216087a40e986d4f84cf2a230638bde014e38519e08b50282e90e5d')
sha256sums_aarch64=('5fcc6c37e375be244d4d64a293d1f1574834fbfd3036d113fd886ca632f964ff')

# Releases are dated, 0.YYYYMMDD.N, and land on the canary channel first as GitHub
# prereleases: /releases/latest is the newest one that passed the heavy tests
latestver() {
  gh api repos/indexable-inc/blaze/releases/latest --jq .tag_name |
    sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p'
}

package() {
  local _dir="blaze-v${pkgver}-${CARCH}-unknown-linux-gnu"

  # blaze runs ra-jit and blaze-proc-macro-srv from out of the directory of its own
  # executable, so the programs stay together here and /usr/bin points at them
  install -d "${pkgdir}/usr/lib/blaze" "${pkgdir}/usr/bin"
  install -m755 "${_dir}"/{blaze,cargo-blaze,cargo-ra-jit,ra-jit,ra-jit-rustc,ra-jit-rustc-first,blaze-proc-macro-srv} \
    "${pkgdir}/usr/lib/blaze/"
  ln -s ../lib/blaze/blaze "${pkgdir}/usr/bin/blaze"
  ln -s ../lib/blaze/cargo-blaze "${pkgdir}/usr/bin/cargo-blaze"
  ln -s ../lib/blaze/cargo-ra-jit "${pkgdir}/usr/bin/cargo-ra-jit"

  install -Dm644 "${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_dir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

check() {
  local _dir="blaze-v${pkgver}-${CARCH}-unknown-linux-gnu"
  local _got
  _got=$("${srcdir}/${_dir}/blaze" --version | awk '{print $2}')
  [[ $_got == "$pkgver" ]] || { error "blaze reports $_got, expected $pkgver"; return 1; }
}
