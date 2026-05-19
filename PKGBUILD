# Maintainer: Gustav Åkerström 23389010+gustavakerstrom@users.noreply.github.com

pkgname=hf-mount
pkgver=0.6.1
pkgrel=1
pkgdesc='Mount Hugging Face Buckets and repos as local filesystems. No download, no copy, no waiting.'
arch=('x86_64' 'aarch64')
url='https://github.com/huggingface/hf-mount'
license=('Apache-2.0')
depends=('fuse3')
makedepends=('rust>=1.89' 'cargo')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('833ef94e2e2c0bc433ba8630a9f14621efc5c214598d32a4d69674fe2ab9a8ba')

prepare() {
  cd "${pkgname}-${pkgver}"
  target="$(rustc -vV | sed -n 's/host: //p')"

  cargo fetch --locked --target $target
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --features fuse,nfs
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --lib --features fuse,nfs
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/hf-mount" -t "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/hf-mount-nfs" -t "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/hf-mount-fuse" -t "${pkgdir}/usr/bin/"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
