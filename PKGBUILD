# Maintainer: Ruben Gonzalez <rgonzalez@fluendo.com> and Carlos Falgueras <cfalgueras@fluendo.com>

pkgname=fluster
pkgver=0.6.0
pkgrel=1
pkgdesc="Testing framework for decoders conformance"
arch=(any)
url="https://github.com/fluster/fluster"
license=(LGPL-3.0)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-black
  python-pylint
  flake8
  mypy
)
checkdepends=(
  git
  python-pytest
)

source=("git+https://github.com/fluendo/fluster.git#branch=master")
sha256sums=('SKIP')

_archive="$pkgname-$pkgver"

build() {
  cd "fluster"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ls dist/*.whl
  python -m installer --destdir=tmp_install dist/*.whl

  # Completions
  export PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH"
  _fluster_cmd="$PWD/tmp_install/usr/bin/fluster"
  _FLUSTER_COMPLETE=bash_source $_fluster_cmd > fluster.bash
  _FLUSTER_COMPLETE=fish_source $_fluster_cmd > fluster.fish
  _FLUSTER_COMPLETE=zsh_source $_fluster_cmd > fluster.zsh
}

check() {
  cd "fluster"

  make check
}

package() {
  cd "fluster"

  python -m installer --destdir="$pkgdir" dist/*.whl

  find test_suites -name "*json" -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/{}" \;

  install -Dm644 fluster.bash "$pkgdir/usr/share/bash-completion/completions/fluster"
  install -Dm644 fluster.fish "$pkgdir/usr/share/fish/vendor_completions.d/fluster.fish"
  install -Dm644 fluster.zsh "$pkgdir/usr/share/zsh/site-functions/_fluster"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
