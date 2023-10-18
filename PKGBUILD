# Maintainer:

_pkgname="libinput-gestures-qt"
pkgname="$_pkgname-git"
pkgver=0.4.r7.g0868859
pkgrel=1
pkgdesc="Qt-based GUI for libinput-gestures"
arch=('any')
url="https://github.com/OneAdder/libinput_gestures_qt"
license=('GPL3')

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

provides=('libinput_gestures_qt')
conflicts=('libinput_gestures_qt')

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _commit=''
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc::git+$url.git#tag=v.$pkgver")
  sha256sums=('SKIP')
else
  # git package
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc::git+$url.git")
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
fi

prepare() {
  # don't install duplicate files
  sed -E '/local\/share/d' -i "$srcdir/$_pkgsrc/setup.py" 

  # fix .desktop file
  sed -E 's@^Icon=.*$@Icon=libinput-gestures-qt@g' \
    -i "$srcdir/$_pkgsrc/libinput_gestures_qt/logo/libinput-gestures-qt.desktop"
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
