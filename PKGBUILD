# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-qh3'
_pkgname="${pkgname}"
_srcname="${_pkgname/python-/}"
pkgver=1.0.1
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
replaces=("$_pkgname-bin")
source=(
  "https://files.pythonhosted.org/packages/source/${_srcname::1}/$_srcname/$_srcname-$pkgver.tar.gz"
)
sha256sums=(
  'dbfb7d6a7b2d096282ad6bee53121a536723a50b8a0d5ad5d23849daa864f5c3'
)
options=('lto')

build() {
  cd "$_srcname-$pkgver"

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
  cd "$_srcname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
