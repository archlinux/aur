# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname="${pkgname#python-}"
pkgver=0.4.2
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')
url='https://github.com/erezsh/runtype'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-recommonmark'
  'python-sphinx'
  'python-sphinx-markdown-tables'
  'python-wheel'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
  make -C docs man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Let's be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0644" LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in {CHANGES,README}.md; do
    install "-${_v}Dm0644" "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done

  install "-${_v}Dm0644" docs/_build/man/runtype.7 "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

sha256sums=(
  'f9c4fe31a70f8385dd1c92606b1f7a5c3b89f4d76e0f801537005c04241ddaca'
)
b2sums=(
  '31095c51075b1dffca87d5b611992c6abb1c1973a8df36a1fc09997ddafbcb3790f05d00a335e79736fa1933a6156f1e363bb9710bbd987a53d43e6b318a91bb'
)

# eof
