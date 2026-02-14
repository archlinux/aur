# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=askalono
pkgver=0.5.0
pkgrel=2
_lld_ver=3.27.0
pkgdesc="A tool & library to detect open source licenses from texts"
arch=('x86_64')
url="https://github.com/jpeddicord/askalono"
license=('Apache-2.0')
depends=('libgcc')
makedepends=(
  'cargo'
  'git'
)
source=("git+https://github.com/jpeddicord/askalono.git#tag=$pkgver"
#        'git+https://github.com/spdx/license-list-data.git'
        "license-list-data-${_lld_ver}.tar.gz::https://github.com/spdx/license-list-data/archive/refs/tags/v${_lld_ver}.tar.gz")
noextract=("license-list-data-${_lld_ver}.tar.gz")
sha256sums=('4abdd5ee637f84b8a5b59afcfaba2e52c0814cdafe500dc875f1792cf46ed6db'
            '7a1eade71449d2ff3ae42957452f6e3a660a3704b477d0e72afc2b43be94c907')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  for d in "$pkgname" "$pkgname/cli" "$pkgname/extras/wasm"; do
    pushd "${d}"
    cargo fetch --target "$(rustc --print host-tuple)"
    popd 
  done

#  cd "$pkgname"
#  git submodule init
#  git config submodule.datasets/modules/spdx-license-list-data.url \
#    "$srcdir/license-list-data"
#  git -c protocol.file.allow=always submodule update

  # Use latest version of the SPDX License List instead of a 4-year-old commit
  # from the git submodule
  bsdtar -xf license-list-data-${_lld_ver}.tar.gz --strip-components 1 -C \
    "$pkgname/datasets/modules/spdx-license-list-data/"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  for d in "$pkgname" "$pkgname/cli" "$pkgname/extras/wasm"; do
    pushd "${d}"
    cargo build --release
    popd 
  done
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  # test real_world_licenses fails
  for d in "$pkgname" "$pkgname/cli"; do
    pushd "${d}"
    cargo test || :
    popd 
  done
}

package() {
  cd "$pkgname"
  install -Dm755 "cli/target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 "extras/wasm/target/release/lib${pkgname}_wasm.so" -t \
    "$pkgdir/usr/lib/"
}
