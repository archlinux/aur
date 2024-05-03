# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-qh3-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=1.0.4.r0.g4492d16
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python (built from latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=(
  'gcc-libs'
  'glibc'
  'python>3.7'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst SECURITY.md
}

# eof
