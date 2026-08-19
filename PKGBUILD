# Maintainer: 苏向夜 <fu050409@163.com>
# SPDX-FileCopyrightText: 2026 Fomalhaut contributors
# SPDX-License-Identifier: 0BSD

pkgname=fomalhaut-lock
_upstream_name=fomalhaut
_upstream_ver=0.1.0-alpha.2
_source_ref=71c0a28a60690550a4904a419962a150734e0090
pkgver=0.1.0.alpha.2
pkgrel=1
pkgdesc='WebKitGTK Wayland session locker'
arch=('x86_64')
url='https://github.com/noctisynth/fomalhaut'
license=('AGPL-3.0-only')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'libgcc'
  'libsoup3'
  'pam'
  'webkitgtk-6.0'
)
optdepends=('accountsservice: current user avatar')
makedepends=('cargo' 'clang')
backup=('etc/pam.d/fomalhaut-lock')
source=("${_upstream_name}-${_source_ref}.tar.gz::${url}/archive/${_source_ref}.tar.gz")
sha256sums=('8e732f4d1b9490ea3104506c4197f763036896c76b5daf2258436d64d234baac')

_source_dir="${_upstream_name}-${_source_ref}"

prepare() {
  cd "${_source_dir}"
  cargo fetch --locked
}

build() {
  cd "${_source_dir}"
  CARGO_TARGET_DIR=target cargo build --frozen --release --package fomalhaut-lock
}

check() {
  cd "${_source_dir}"
  CARGO_TARGET_DIR=target cargo test --frozen \
    --package fomalhaut-lock --package fomalhaut-logind --package fomalhaut-pam \
    --package fomalhaut-user --all-targets
}

package() {
  cd "${_source_dir}"

  sed 's|@FOMALHAUT_''LOCK@|/usr/bin/fomalhaut-lock|' \
    packaging/systemd/fomalhaut-lock.service.in >target/fomalhaut-lock.service
  install -Dm755 target/release/fomalhaut-lock "${pkgdir}/usr/bin/fomalhaut-lock"
  install -Dm644 packaging/pam/fomalhaut-lock \
    "${pkgdir}/etc/pam.d/fomalhaut-lock"
  install -Dm644 target/fomalhaut-lock.service \
    "${pkgdir}/usr/lib/systemd/user/fomalhaut-lock.service"
  install -Dm644 packaging/idle/swayidle.conf \
    "${pkgdir}/usr/share/doc/${pkgname}/swayidle.conf"
  install -Dm644 packaging/niri/fomalhaut-lock.kdl \
    "${pkgdir}/usr/share/doc/${pkgname}/niri.kdl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/CONFIGURATION.md \
    "${pkgdir}/usr/share/doc/${pkgname}/configuration.md"
}
