# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

: ${_commit:=62b4a0aad505fd314b6842b4518ed9e0f21b35b9}

_pkgname="mtkclient"
pkgname="$_pkgname"
pkgver=2.1.3
pkgrel=2
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
optdepends=(
  'android-udev: ADB/Fastboot support'
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
  local _plugdev_regex='s&GROUP="plugdev"&TAG+="uaccess"&g'

  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/udev/rules.d/51-mtkclient-edl.rules <<< "$(sed -e "$_plugdev_regex" Setup/Linux/51-edl.rules)"

  install -Dm644 Setup/Linux/52-mtk.rules "$pkgdir"/usr/lib/udev/rules.d/52-mtkclient.rules
}
