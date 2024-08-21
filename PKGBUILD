# Maintainer: Anton Hvornum <anton@hvornum.se>

pkgname=python-onepassword-keyring
pkgver=0.1.1
pkgrel=4
pkgdesc="Keyring backend reading password data from 1Password"
arch=(any)
url="https://github.com/falling-springs/onepassword-keyring"
license=(MIT)
depends=(python-keyring)
makedepends=(
    python-build
    python-installer
    python-wheel
    flake8
    python-pytest
    python-pytest-mock
    python-setuptools
)
provides=(python-onepassword-keyring)
conflicts=(python-onepassword-keyring python-onepassword-keyring-git)
replaces=(python-onepassword-keyring python-onepassword-keyring-git)
_version_commit="bffdc609a0a99a6c172add026cb500dc8331ce44"
source=(
  $pkgname-$pkgver::git+https://github.com/falling-springs/onepassword-keyring.git#commit=$_version_commit
)
sha512sums=('15fa8a50cc408de39465df09b88a7fa5ce6d02fccfdd11ec5640df6d427ff2d25dfb6714bbb096992d5fed95c7a49f1a1f06a9ebd775bd8a085ef71e0d771d3a')
b2sums=('bc7dd477c3b348a9f627bed92cbe97a506952dc8cd5c690a00e018ed0b7cf47a5bb5c81e33fce06466224dd1bd0c3c0b00c8caf40fb3dbd15637bc6d6bfc4138')

# Waiting for PR https://github.com/falling-springs/onepassword-keyring/pull/2
# pkgver() {
#   cd "$pkgname-$pkgver"
#   # Due to lack of git tagging in the project, `git describe` will fail with:
#   # > No names found, cannot describe anything.
#   # Falling back to sed grabing the version string
#   sed -nr 's/version.*"([0-9]+.[0-9]+.[0-9])"/\1/p' pyproject.toml
# }

check(){
    cd $pkgname-$pkgver
    ls -l onepassword_keyring/

    # Disable coverage reports and other outputs
    python -m pytest -o addopts="-vv"
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
