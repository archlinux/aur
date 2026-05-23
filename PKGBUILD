# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Mohamed Hammad <Mohamed.Hammad@SpacecraftSoftware.org>
#
# gitway-git — builds gitway from the latest git HEAD.
# Use this package if you want the cutting edge, or if your architecture
# is not covered by the pre-built binary (gitway-bin).
#
# Build dependencies: rust (stable), cargo, perl (required by aws-lc-rs),
#                     gcc, pkg-config, git
#
# Project page: https://SpacecraftSoftware.org/gitway/

pkgname=gitway-git
pkgver=r0.HEAD
pkgrel=1
pkgdesc="Pure-Rust SSH toolkit for Git: transport, keys, signing, agent — git HEAD"
arch=('x86_64' 'aarch64')
url="https://github.com/Spacecraft-Software/Gitway"
license=('GPL-3.0-or-later')
provides=('gitway')
conflicts=('gitway' 'gitway-bin')
makedepends=('git' 'rust' 'cargo' 'perl' 'gcc' 'pkg-config')

source=("${pkgname}::git+https://github.com/Spacecraft-Software/Gitway.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  # Suppress NixOS-style RUSTFLAGS that may be inherited in unusual environments.
  # `-p gitway` builds both [[bin]] targets (gitway + gitway-keygen) from the
  # gitway-cli crate since they share codegen.
  RUSTFLAGS="" cargo build --release -p gitway
}

check() {
  cd "${srcdir}/${pkgname}"
  RUSTFLAGS="" cargo test --workspace
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 target/release/gitway         "${pkgdir}/usr/bin/gitway"
  install -Dm755 target/release/gitway-keygen  "${pkgdir}/usr/bin/gitway-keygen"
  install -Dm755 target/release/gitway-add     "${pkgdir}/usr/bin/gitway-add"
  install -Dm644 README.md                     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
