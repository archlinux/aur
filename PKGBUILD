# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=spice-crypt
pkgver=3.0.1
pkgrel=1
pkgdesc='Tool to decrypt encrypted LTSpice models'
arch=(x86_64)
url='https://github.com/jtsylve/spice-crypt'
license=(AGPL-3.0-or-later CC-BY-4.0)
depends=(
  glibc
  libgcc
  python
  python-cryptography
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('cb5e4056d0ebbb5d65ac71e9eb431372ee4cd56b47f839389f6304f7f9783a75e81754ec4642350ab610e8238eacf6a8e1239d5cd1063758a952e163f4e6e868')
b2sums=('75f14a98a7e37ea4b114d0e19ed40ed96fb65ab905f1dff9c49af97e30787944797af60c062a72d4114e07bfbb1cd80238e2b4e126a6f9e8ed4b702f88bdda2f')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_opts=(
    -v
    --deselect tests/test_pspice_decrypt.py::TestKeyRecovery::test_recover_user_key
    --deselect tests/test_pspice_decrypt.py::TestKeyRecovery::test_recover_no_user_key_raises
  )

  pytest "${pytest_opts[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
