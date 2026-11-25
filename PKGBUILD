# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=bladebro
pkgver=4.8.4
pkgrel=1
pkgdesc='Agentic browser driver for AI: five MCP tools over a real Chromium session'
arch=('x86_64' 'aarch64')
url='https://github.com/dondai44423/bladebro'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'rust')
optdepends=(
  'chromium: Chromium-family browser for the agent lane'
  'xvfb: virtual display for hosts without one'
  'xfwm4: window manager, so a headful Xvfb session has frame extents'
)
conflicts=('bladebro-bin')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('facf404284656eb455dd561d115936f73292c6caefeffce6edb105dd65998ed6')

latestver() {
  gh api repos/dondai44423/bladebro/releases/latest --jq .tag_name |
    sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p'
}

prepare() {
  cd "${pkgname}-${pkgver}"

  # the pin selects a rustup toolchain, while the `rust` dependency already supplies one; leaving
  # it in place makes a rustup-equipped builder download a second toolchain in the middle of a build
  rm -f rust-toolchain.toml

  # audit.rs is the one release-code use of env!("CARGO_MANIFEST_DIR"), which no path-remap flag
  # reaches, so the builder's home directory lands in the binary; as a fallback lookup it can never
  # resolve on an installed system, and "." matches the project-root entry already beside it
  sed -i 's|PathBuf::from(env!("CARGO_MANIFEST_DIR"))|PathBuf::from(".")|' src/audit.rs
  grep -q 'PathBuf::from(".")' src/audit.rs || { error 'audit.rs no longer matches the path patch'; return 1; }

  # crates.io has no versioned URL per crate, so the dependency tree arrives here instead of in
  # source=(); build() then runs --frozen and cannot reach the network
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"

  # ring's assembly build inherits CFLAGS through the cc crate, and a tuned makepkg.conf
  # (-march=native, -O3, -flto) makes its objects fail to link with undefined ring_core_* symbols;
  # clearing the flags also leaves Cargo.toml's own lto=thin profile in control of the Rust build
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

  # build.rs stamps `git rev-parse HEAD` into the binary when it finds a repository, so a build run
  # inside one embeds that repo's commit while a clean chroot embeds "unknown"; the ceiling is
  # exclusive, so naming ${srcdir} stops the search at the extracted tree and both agree
  export GIT_CEILING_DIRECTORIES="${srcdir}"

  cargo build --release --locked --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/bladebro "${pkgdir}/usr/bin/bladebro"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-${pkgver}"
  local _got
  _got=$(./target/release/bladebro --version | sed -nE '1s/^bladebro v([^ ]+).*/\1/p')
  [[ $_got == "$pkgver" ]] || { error "bladebro reports '${_got}', expected ${pkgver}"; return 1; }
}
