# Copyright (c) 2026 l5yth
# SPDX-License-Identifier: Apache-2.0
# Maintainer: l5yth <aur@l5y.tech>

pkgname=psn-git
pkgver=0.1.1.r0.g6822583
pkgrel=1
pkgdesc="Terminal UI for process status navigation and control"
arch=('x86_64')
url="https://github.com/l5yth/psn"
license=('Apache')
options=('!debug')
depends=('procps-ng')
makedepends=('cargo' 'git')
source=("git+https://github.com/l5yth/psn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/psn"
  local desc
  desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n "${desc}" ]]; then
    printf '%s\n' "${desc}" | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf "0.0.0.r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/psn"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/psn"
  cargo test --all --all-features --locked
}

package() {
  cd "${srcdir}/psn"
  install -Dm755 "target/release/psn" "${pkgdir}/usr/bin/psn"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
