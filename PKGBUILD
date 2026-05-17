# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=python-opensips
pkgver=0.1.9
pkgrel=1
pkgdesc='Python module used to communicate with OpenSIPS'
arch=(any)
url='https://github.com/OpenSIPS/python-opensips'
license=('GPL-3.0-or-later')

depends=(
  python
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenSIPS/python-opensips/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4720d29b3c317d29d7259656c49c3f043eb83697211efbbf171b53c1bca0b4f5')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Install python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install docs
  for file in docs/*; do
    install -Dm0644 -t "$pkgdir/usr/share/doc/python-opensips" "$file"
  done

  # Install bash completions
  install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions" "utils/completion/python-opensips"
  ln -s python-opensips "$pkgdir/usr/share/bash-completion/completions/opensips-event"
  ln -s python-opensips "$pkgdir/usr/share/bash-completion/completions/opensips-mi"
}
