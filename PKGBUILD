# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-jh2'
_pkgname="${pkgname}"
_srcname="${_pkgname/python-/}"
pkgver=5.0.3
pkgrel=2
pkgdesc='HTTP/2 State-Machine based protocol implementation'
arch=('aarch64' 'x86_64')
url='https://pypi.org/project/h2/'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.7'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
  'python-setuptools'
  'python-wheel'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_srcname::1}/$_srcname/$_srcname-$pkgver.tar.gz"
)
sha256sums=(
  'c13d97a3f82a02e6a2a89606f1ffe1771670266dc7746140e00e66c4dad12b14'
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

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.rst

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

# eof
