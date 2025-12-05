# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=prefixer
pkgdesc="Modern Proton Prefix management tool"

pkgver=1.2.8
pkgrel=1

arch=('any')

url="https://github.com/wojtmic/prefixer"
license=('GPL3')

depends=('python>3.13' 'python-vdf' 'python-json5' 'python-requests' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wojtmic/prefixer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('009c15db0612d35678d7602e10a0548cf229861ef1fb2f2e189322f7bd3a903f')

build() {
  cd "$srcdir/prefixer-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/prefixer-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/prefixer/tweaks"
  cp -r prefixer/data/tweaks/* "$pkgdir/usr/share/prefixer/tweaks/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/prefixer/tweaks"

  echo "Generating shell completions..."
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"

  export PATH="$pkgdir/usr/bin:$PATH"
  export PYTHONPATH="$pkgdir/usr/lib/python3.13/site-packages"

  _PREFIXER_COMPLETE=zsh_source prefixer > \
      "$pkgdir/usr/share/zsh/site-functions/_prefixer"

  _PREFIXER_COMPLETE=bash_source prefixer > \
      "$pkgdir/usr/share/bash-completion/completions/prefixer"

  _PREFIXER_COMPLETE=fish_source prefixer > \
      "$pkgdir/usr/share/fish/vendor_completions.d/prefixer.fish"
}
