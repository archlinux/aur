# Copyright (c) 2026 l5yth
# SPDX-License-Identifier: Apache-2.0
# Maintainer: l5yth <aur@l5y.tech>

pkgname=podserv-b-git
pkgver=0.1.1.r0.g2dee28d
pkgrel=1
pkgdesc="a minimalist podcast server (type b) for serving media files on the web"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/l5yth/podserv-b"
license=('Apache-2.0')
options=('!debug')
install=podserv-b.install
makedepends=('cargo' 'git')
source=("git+https://github.com/l5yth/podserv-b.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/podserv-b"
  local desc
  desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n "${desc}" ]]; then
    printf '%s\n' "${desc}" | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf "0.0.0.r%s.g%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "${srcdir}/podserv-b"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/podserv-b"
  cargo build --release --locked --offline
}

check() {
  cd "${srcdir}/podserv-b"
  cargo test --all --all-features --locked --offline
}

package() {
  cd "${srcdir}/podserv-b"
  install -Dm755 "target/release/podserv-b"                    "${pkgdir}/usr/bin/podserv-b"
  install -Dm644 "packaging/systemd/podserv-b.service"         "${pkgdir}/usr/lib/systemd/system/podserv-b.service"
  install -Dm644 "Config.toml"                                 "${pkgdir}/etc/podserv-b.toml.example"
  install -Dm644 "LICENSE"                                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md"                                   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/srv/podcasts"
}

