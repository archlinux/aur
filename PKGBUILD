# Maintainer:
# Contributor: Ben Westover <kwestover.kw@gmail.com>

_pkgname="mtkclient"
pkgname="$_pkgname-git"
pkgver=2.1.4.1.r35.g60e07f3
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

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
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

pkgver() {
  cd "$_pkgsrc"
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

  install -Dm644 Setup/Linux/51-edl.rules "$pkgdir"/usr/lib/udev/rules.d/51-mtkclient-edl.rules

  install -Dm644 Setup/Linux/52-mtk.rules "$pkgdir"/usr/lib/udev/rules.d/52-mtkclient-mtk.rules
}
