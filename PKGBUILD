# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='jetforce'
pkgver=1.0.0
pkgrel=1
pkgdesc='Experimental Gemini protocol server'
arch=('any')
license=('LicenseRef-FloodgapFSL')  # SPDX-License-Identifier: LicenseRef-FloodgapFSL
url='https://github.com/michael-lazar/jetforce'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
changelog="$pkgname.changelog"
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-pyopenssl'
  'python-twisted'
)
optdepends=(
  'python-standard-cgi: for running the example CGIs'
)
provides=("$pkgname"{,-client} "python-$pkgname")
replaces=("python-$pkgname")

build() {
  cd "$pkgname-$pkgver"

  python -m build --no-isolation --skip-dependency-check --wheel
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  _install() {
    test -t 1 && _verbose='-v' || _verbose=''
    # shellcheck disable=SC2086
    install $_verbose "$@"
  }

  _install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,README}.md
  _install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.py
  _install -Dm0755 -t "$pkgdir/usr/share/doc/$pkgname/examples/cgi" \
    examples/cgi/*.cgi
  _install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  'a29637e168e1ac5b1d87f56786617f580737633b1344e1afd33177a1d2e5c2c8'
)
b2sums=(
  '6e4a5e13487fc74a3976f1b05efa0a632b062203705bc90f6470dfff60d844e79de155a93800aa2eba0942d83b646a5b77c141fb4f1f85819a63cc3c191e8764'
)

# eof
