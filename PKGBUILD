# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-uv-latest-bin'
pkgver=0.1.4
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
makedepends=('awk' 'git' 'python-pip')
provides=('uv')
conflicts=('uv')  # and python-uv?
# We only use this to fool AUR helpers into believing that
# this is a development package (and for the README):
source=("git+$url.git")
sha256sums=('SKIP')

_orig='uv'

# First we install a local copy of the PyPI package so that
# we can extract the version information
prepare() {
  install -vdm0755 "$srcdir/$pkgname"
  # pip may complain that a newer version of pip is available from PyPI,
  # which is irrelevant here, so let's hush it with two times --quiet.
  pip --quiet --quiet install --no-deps --target "$srcdir/$pkgname" uv
}

# Secondly we read the version from the METADATA file
pkgver() {
  awk '$1 == "Version:" {print $2; exit}' \
    "$srcdir/$pkgname/uv-"*".dist-info/METADATA"
}

# Thirdly we do nothing, as the binary has been built for us by PyPI
build() {
  true
}

# And now we have everything we need to put together a package
package() {
  cd "$srcdir/$_orig"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$srcdir/$pkgname/bin"
  install -vDm0755 uv "$pkgdir/usr/bin/uv"

  cd "$srcdir/$pkgname/uv-"*".dist-info/license_files"
  for _license in LICENSE-*; do
    install -vDm0644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}

# eof
