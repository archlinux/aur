# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Deepu K Sasidharan <d4udts@gmail.com>
#
# Based on the upstream AUR `kdash` package. 
# The release jobs only bump `pkgver` and regenerate the
# checksums with `updpkgsums`, so review keeps surfacing genuine changes only.

pkgname=kdash
pkgver=2.1.1
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
b2sums=('01079297f08d8bd2fbcfb275471f1d2c5bc4871610665f4e67b9ba5e3c49dd9e6466d4b51d43a7550b51538927187caa5dfb96bfe6f1ed3fd1ee50ab909e6d46')

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
