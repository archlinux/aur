# Maintainer: haxibami <contact at haxibami dot net>
# Original Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=openconnect-sso-git
_pkgname=openconnect-sso
pkgver=0.8.0.r60.g9412807
pkgrel=2
pkgdesc="Wrapper script for OpenConnect supporting Azure AD (SAMLv2) authentication (git version)"
arch=("any")
url="https://github.com/vlaci/openconnect-sso"
license=("GPL3")
provides=("openconnect-sso")
conflicts=("openconnect-sso")
depends=("python" "python-attrs" "python-colorama" "python-importlib-metadata" "python-lxml"
         "python-keyring" "python-prompt_toolkit" "python-pyxdg" "python-requests" "python-structlog"
         "python-toml" "python-setuptools" "python-pysocks" "python-pyqt6" "python-pyqt6-webengine"
         "python-pyotp" "sudo" "openconnect")
makedepends=("git" "python-poetry" "python-build" "python-wheel" "python-installer")
optdepends=()
source=("${_pkgname}::git+https://github.com/vlaci/openconnect-sso/#branch=master"
        "relax-poetry-version-constraints.patch")
sha256sums=("SKIP"
            "49dd182b8f7a5415db1f9c44ad7a4919524ee205cb98fe7c72e15c20b6c1872d")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../relax-poetry-version-constraints.patch
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
