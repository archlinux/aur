# Maintainer:

_pkgname="libinput-gestures-qt"
pkgname="$_pkgname-git"
pkgver=0.4.r7.g0868859
pkgrel=2
pkgdesc="Qt-based GUI for libinput-gestures"
url="https://github.com/OneAdder/libinput_gestures_qt"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'libinput-gestures'
  'python-pyqt5'
  'qt5-tools'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  _regex='^\s*version='\''([0-9]+\.[0-9]+(\.[0-9]+)?)'\'',$'
  _file="setup.py"

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    printf '%s' "$_line" | sed -E "s@$_regex@\1@"
  )

  git describe --long --tags --match="v.$_version" | sed -E 's/^v\.?//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # don't install duplicate files
  sed -E '/local\/share/d' -i setup.py

  # fix .desktop file
  sed -E 's@^Icon=.*$@Icon=libinput-gestures-qt@g' \
    -i libinput_gestures_qt/logo/libinput-gestures-qt.desktop
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
