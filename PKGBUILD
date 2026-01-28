# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

_pkgname="mtkclient"
pkgname="$_pkgname-git"
pkgver=2.1.2.r10.g91f996b
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
url="https://github.com/bkerler/mtkclient"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'pyside6'
  'python'
  'python-capstone'
  'python-colorama'
  'python-fusepy' # AUR
  'python-keystone'
  'python-pycryptodomex'
  'python-pyserial'
  'python-pyusb'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git tag 2.1.2 65d8c4aa8912e5f5d152466362c78ab1fbbfcd47 2> /dev/null || true
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # udev rules
  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/udev/rules.d/52-mtk-edl.rules << END
# Qualcomm EDL
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9008", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Qualcomm Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9006", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Qualcomm Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="900E", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# LG Memory Debug
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1004", ATTRS{idProduct}=="61a1", MODE="0660", GROUP="adbusers", TAG+="uaccess"

# Sierra Wireless
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1199", ATTRS{idProduct}=="9071", MODE="0660", GROUP="adbusers", TAG+="uaccess"
END
}
