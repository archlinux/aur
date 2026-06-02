# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=spice-crypt
pkgver=3.0.0rc1
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
sha512sums=('529cab66d8ff0ed5b76a753cd0765d36c7e0169ccd2ec6d4be8f5868b86e451eab31de73eb200954261ade4683c5305a80fa4ffb6a00820290f667c196e49f71')
b2sums=('471b2a31e6896ddd4e8c227321ad155149a1383b0e04c0ad8c8a12f19c5a3ea1fc727a42a84b596460edcb845ee17b83160898cadf59b99f46bd2bc974eb836b')

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
