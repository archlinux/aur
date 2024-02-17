# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-uv-latest-bin'
pkgver=0.1.3
pkgrel=1
pkgdesc='An extremely fast Python package installer and resolver, written in Rust (latest binary from PyPI)'
arch=('aarch64' 'armv7l' 'i686' 'x86_64')
url='https://github.com/astral-sh/uv'
#license=(
#  'Apache-2.0'  # SPDX-License-Identifier: Apache-2.0
#  'MIT'         # SPDX-License-Identifier: MIT
#)
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('awk' 'python-pip')
provides=('uv')
conflicts=('python-uv' 'uv')
source=(
  'https://raw.githubusercontent.com/astral-sh/uv/main/README.md'
)
noextract=('README.md')
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/$pkgname"
  # pip may complain that a newer version of pip is available from PyPI,
  # which is irrelevant here, so let's hush it with two times --quiet.
  pip --quiet --quiet install --no-deps --target "$srcdir/$pkgname" uv
}

pkgver() {
  awk '$1 == "Version:" {print $2; exit}' \
    "$srcdir/$pkgname/uv-"*".dist-info/METADATA"
}

build() {
  true
}

package() {
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$srcdir/$pkgname/bin"
  install -vDm0755 uv "$pkgdir/usr/bin/uv"

  cd "$srcdir/$pkgname/uv-"*".dist-info/license_files"
  for _license in LICENSE-*; do
    install -vDm0644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}

# eof
