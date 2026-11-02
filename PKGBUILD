# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_basename=ayagami
pkgname="${_basename}-git"
epoch=1
pkgver=r121.0d1d7aa
pkgrel=1
pkgdesc="A 2D puppet model renderer compatible with Live2D (development version)"
arch=('x86_64')
url="https://github.com/AyagamiDev/${_basename}"
license=('Apache-2.0 OR MIT')
depends=('libgcc' 'glibc')
makedepends=('git' 'cargo')
install="${_basename}.install"

source=("${pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  # No tags yet!
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  # Tags in place
  # git describe --tags --long | sed "s/\-/.r/;s/\-g/./"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  
  export RUSTUP_TOOLCHAIN=stable
  
  # Non-reproducible: no lock file in repo.
  cargo update
  
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}"

  # No Rust rlibs are packed because of their nature!

  # C libraries
  for l in \
    libayagami libayagami_render
  do
    install -Dm644 "target/release/${l}.so" "${pkgdir}/usr/lib/${_basename}/${l}.so"
  done

  # Demo executables
  for e in \
    load-model ayagami-demo demo_renderer
  do
    install -Dm755 "target/release/$e" "${pkgdir}/usr/bin/$e"
  done

  # Documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Licenses
  for p in \
    APACHE MIT
  do
    install -Dm644 "LICENSE-${p}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${p}"
  done
}

