# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Deepu K Sasidharan <d4udts@gmail.com>
#
# Based on the upstream AUR `kdash` package. 
# The release jobs only bump `pkgver` and regenerate the
# checksums with `updpkgsums`, so review keeps surfacing genuine changes only.

pkgname=kdash
pkgver=2.0.2
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs')
# libxcb is only needed for copy-to-clipboard. The binary dlopens it at runtime
# and runs fine without it, so it is an optional dependency rather than a hard one.
optdepends=('libxcb: copy-to-clipboard support')
# `rust` provides cargo + rustc; `git` is for the VCS source. No python: nothing
# in the dependency tree builds with it (ring's build uses perl, not python).
makedepends=('git' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/kdash-rs/${pkgname}.git#tag=v${pkgver}")
b2sums=('ea9598890bfc302ec8688221df879f679251112adf6bfc483a02b701c9df4a414fdf0d8cb07d2417202487cea196a866524ba92183cccc61260e7798513d24ed')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # license
  install -D -m644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
