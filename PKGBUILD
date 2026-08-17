# Maintainer: 苏向夜 <fu050409@163.com>
# SPDX-FileCopyrightText: 2026 Fomalhaut contributors
# SPDX-License-Identifier: 0BSD

pkgname=greetd-fomalhaut
_upstream_name=fomalhaut
_upstream_ver=0.1.0-alpha.3
_source_ref=2300034dcfac72e13c8475d992fa9c75aac933ed
pkgver=0.1.0.alpha.3
pkgrel=1
pkgdesc='WebKitGTK display manager greeter for greetd'
arch=('x86_64')
url='https://github.com/noctisynth/fomalhaut'
license=('AGPL-3.0-only')
depends=(
  'cage'
  'dbus'
  'glib2'
  'glibc'
  'greetd'
  'gtk4'
  'libgcc'
  'libsoup3'
  'webkitgtk-6.0'
)
optdepends=('accountsservice: user display names and avatars')
makedepends=('cargo')
source=(
  "${_upstream_name}-${_source_ref}.tar.gz::${url}/archive/${_source_ref}.tar.gz"
  'greetd-fomalhaut.toml'
)
sha256sums=(
  'b50fccd46264d6d3e3f2cd5c5408df007a1fc6eb6949102b3c2a36a282488277'
  '236bc34f610fcd42dc5dc49ca27338ee917f48043fc2c38c1e8bc50b20409b9a'
)

_source_dir="${_upstream_name}-${_source_ref}"

prepare() {
  cd "${_source_dir}"
  cargo fetch --locked
}

build() {
  cd "${_source_dir}"
  CARGO_TARGET_DIR=target cargo build --frozen --release --package fomalhaut
}

check() {
  cd "${_source_dir}"
  CARGO_TARGET_DIR=target cargo test --frozen \
    --package fomalhaut --package fomalhaut-logind --package fomalhaut-user --all-targets
}

package() {
  cd "${_source_dir}"

  install -Dm755 target/release/fomalhaut "${pkgdir}/usr/bin/fomalhaut"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/CONFIGURATION.md \
    "${pkgdir}/usr/share/doc/${pkgname}/configuration.md"
  install -Dm644 "${srcdir}/greetd-fomalhaut.toml" \
    "${pkgdir}/usr/share/doc/${pkgname}/greetd-config.toml"
}
