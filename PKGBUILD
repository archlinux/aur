# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

_pkgname="mtkclient"
pkgname="$_pkgname-git"
pkgver=1.63.r116.g8e46df6
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
url="https://github.com/bkerler/mtkclient"
license=('GPL-3.0-only')
arch=('any')

depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/bkerler/mtkclient.git"
  "udev.patch"
)
sha256sums=(
  'SKIP'
  'd4b6d7967324e585f69c51257e4293f390291a9534e697eefc94568d169220bc'
)

pkgver() {
  cd mtkclient
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  sed -E -e 's&GPLv3 License&GNU General Public License v3 (GPLv3)&' -i pyproject.toml

  cd "mtkclient"
  # Replace plugdev with uaccess and adbusers like upstream android-udev
  patch -Np1 -i ../../udev.patch
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  depends+=(
    libusb
    pyside6
    python-colorama
    python-pycryptodome
    python-pycryptodomex
    python-pyusb

    python-keystone
    python-capstone
    python-unicorn

    # AUR
    python-fusepy
    python-mock
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 mtkclient/Setup/Linux/51-edl.rules "$pkgdir/usr/lib/udev/rules.d/52-mtk-edl.rules"
}
