# Copyright (c) 2026 l5yth
# SPDX-License-Identifier: Apache-2.0
# Maintainer: l5yth <aur@l5y.tech>

pkgname=lsu-git
pkgver=0.1.1.r0.gcabd0cc
pkgrel=1
pkgdesc="Terminal UI for systemd services and latest journal lines"
arch=('x86_64')
url="https://github.com/l5yth/lsu"
license=('Apache')
options=('!debug')
depends=('systemd')
makedepends=('cargo' 'git')
source=("git+https://github.com/l5yth/lsu.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/lsu"
  local desc
  desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n "${desc}" ]]; then
    printf '%s\n' "${desc}" | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf "0.0.0.r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/lsu"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/lsu"
  cargo test --all --all-features --locked
}

package() {
  cd "${srcdir}/lsu"
  install -Dm755 "target/release/lsu" "${pkgdir}/usr/bin/lsu"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
