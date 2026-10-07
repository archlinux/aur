# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=humanify
pkgver=3.1.1
pkgrel=1
pkgdesc='Deobfuscate Javascript code using ChatGPT'
arch=('x86_64')
url='https://github.com/jehna/humanify'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=('humanifyjs')
replaces=('humanifyjs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jehna/humanify/archive/v${pkgver}.tar.gz")
sha512sums=('999df1b5e8a092859be3590549911706de5ced7fa5fb423c35266ffe02444565db8f4efc7ab04816365c6d72193de21012faf2dbe44119eb3a49d9bc7bbf2da9')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Fixes `ld.lld: error: undefined symbol` and similar link-time
  # errors related to some *-sys crates
  # See also:
  # - https://gitlab.archlinux.org/archlinux/rfcs/-/merge_requests/69
  # - https://github.com/briansmith/ring/issues/1444#issuecomment-5217008291
  CFLAGS+=' -ffat-lto-objects'

  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin/" \
    "target/release/${pkgname}"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
