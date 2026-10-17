# Maintainer: pngdeity <pngdeity@tutanota.com>

_pkgname=bws
pkgname=$_pkgname
_githubname="bitwarden/sdk-sm"
_tag="bws-v\${pkgver}"
pkgver=2.1.0
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/bitwarden/sdk-sm"
# makepkg's `lto` option appends LTOFLAGS (-flto=auto) to CFLAGS, and the `cc`
# crate passes CFLAGS straight to the C compiler, so the bundled sqlite3.c that
# libsqlite3-sys compiles lands in its rlib as a GCC LTO object (.gnu.lto_*
# sections, 8.9M against 3.4M). rustc links with lld by default, and lld does
# not resolve symbols defined by an LTO object inside an archive, so the link
# fails with `undefined symbol: sqlite3_finalize` and the same for every
# ring_core_0_17_14__* symbol from the prebuilt ring assembly. bfd resolves
# them, but selecting it is not an option here: it rejects the LLD-only
# -Wl,--icf=safe that rustc also emits. `!lto` keeps Rust's own optimisation,
# which upstream Cargo.toml sets for the release profile itself.
options=('!lto')
license=('custom:Bitwarden-SDK-License-Agreement')
makedepends=('cargo' 'jq')
depends=('glibc' 'libgcc')
provides=('bws-bin')
conflicts=('bws-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/bws-v${pkgver}.tar.gz")
sha256sums=('3ea669ae57b1d3090f98ff2c09894b4da0bf2c700a4f8d79f70a0f96615cd9ed')

prepare() {
  cd "sdk-sm-bws-v${pkgver}"
  # No --target: it filters the fetch to one triple, and the offline build
  # below cannot recover a dependency it excluded.
  cargo fetch --locked
}

build() {
  cd "sdk-sm-bws-v${pkgver}"
  if ! cargo build --frozen --release -p bws --message-format json > build.json; then
    echo "::error::cargo build failed; see the cargo output above"
    exit 1
  fi
}

check() {
  cd "sdk-sm-bws-v${pkgver}"
  cargo test --frozen -p bws
}

package() {
  cd "sdk-sm-bws-v${pkgver}"

  install -Dm755 "target/release/bws" "${pkgdir}/usr/bin/bws"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _out_dir
  _out_dir=$(jq -r --slurp \
    '.[] | select(.reason == "build-script-executed")
     | select(.package_id | contains("crates/bws")) | .out_dir' \
    build.json)
  if [[ -z "${_out_dir}" || ! -d "${_out_dir}/manpages" ]]; then
    echo "::error::no manpage directory in build.json for crates/bws (got '${_out_dir}')"
    exit 1
  fi
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_out_dir}"/manpages/*.1
}
