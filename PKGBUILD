# Maintainer: aur.chaotic.cx

: ${_commit:=0868859f62e9050c33cfd55df0ffe3ac024cc45d} # 0.4.r7

_pkgname="libinput-gestures-qt"
pkgname="$_pkgname"
pkgver=0.4
pkgrel=2
pkgdesc="Qt-based GUI for libinput-gestures"
url="https://github.com/OneAdder/libinput_gestures_qt"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'libinput-gestures'
  'python-pyqt6'
  'qt6-tools' # for qdbus6
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'xdotool: X11 keyboard shortcut gesture actions'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc::git+$url.git#commit=$_commit"
  '0001-pyqt6.patch'
)
sha256sums=(
  '444103bff0393362c976166771668d436428fb510e873a45b312c7db3c22a869'
  'bc08788a12fbc49a942bc1f946350cde514f9f50908354080f8a0a5bb0f0f15a'
)

prepare() {
  cd "$_pkgsrc"

  # update to PyQt6
  patch -Np1 -F100 -i ../0001-pyqt6.patch

  # regenerate
  pyuic6 libinput_gestures_qt/edit_window.ui -o libinput_gestures_qt/edit_window.py
  pyuic6 libinput_gestures_qt/main_window.ui -o libinput_gestures_qt/main_window.py

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
