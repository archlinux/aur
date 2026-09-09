# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

: ${_commit:=5a863eece86fcaa97cb8325cf747e0aae3c307e4}

_pkgname="mtkclient"
pkgname="$_pkgname"
pkgver=2.1.4.1
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

prepare() {
  cd "$_pkgsrc"

  # fix udev permissions
  local _plugdev_regex=''
  _plugdev_regex+='s&MODE=\S+&MODE="0660",&g;'
  _plugdev_regex+='s&GROUP="plugdev"&TAG+="uaccess"&g;'

  sed -E -e "$_plugdev_regex" -i Setup/Linux/51-edl.rules
  sed -E -e "$_plugdev_regex" -i Setup/Linux/52-mtk.rules
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 Setup/Linux/51-edl.rules "$pkgdir"/usr/lib/udev/rules.d/51-mtkclient-edl.rules

  install -Dm644 Setup/Linux/52-mtk.rules "$pkgdir"/usr/lib/udev/rules.d/52-mtkclient-mtk.rules
}
