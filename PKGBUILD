# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

: ${_commit:=b54c0c2a03f7913db5dc5ae3b783dd34458db84a} # 2.1.2.r9

_pkgname="mtkclient"
pkgname="$_pkgname"
pkgver=2.1.2
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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

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
