# Maintainer: pngdeity <pngdeity@tutanota.com>
_deploy_aur=true

_pkgname=bws
pkgname=$_pkgname
_githubname="bitwarden/sdk-sm"
_tag="bws-v\${pkgver}"
pkgver=2.1.0
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/bitwarden/sdk-sm"
license=('custom:Bitwarden-SDK-License-Agreement')
makedepends=('cargo' 'jq')
depends=('glibc' 'libgcc')
provides=('bws-bin')
conflicts=('bws-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/bws-v${pkgver}.tar.gz")
sha256sums=('3ea669ae57b1d3090f98ff2c09894b4da0bf2c700a4f8d79f70a0f96615cd9ed')

prepare() {
  cd "sdk-sm-bws-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "sdk-sm-bws-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release -p bws --message-format json > build.json
}

check() {
  cd "sdk-sm-bws-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
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
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_out_dir}"/manpages/*.1
}
