# Maintainer:
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_pkgname=qlog
pkgname="$_pkgname-git"
pkgver=0.34.0.r0.g5f8bf45
pkgrel=1
pkgdesc="Amateur radio logbook software"
arch=("x86_64" "i686")
url="https://github.com/foldynl/QLog"
license=('GPL')

depends=(
  'hamlib'
  'qt6-base'
  'qt6-charts'
  'qt6-serialport'
  'qt6-webengine'
  'qt6-websockets'
  'qtkeychain-qt6'
)
makedepends=(
  'git'
)
optdepends=(
  'org.freedesktop.secrets: keyring/password support'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

_source_qlog() {
  source+=(
    'foldynl.qlog-flags'::'git+https://github.com/foldynl/QLog-Flags.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_qlog() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      'foldynl.qlog-flags'::'res/flags'
    )
    _submodule_update
  )
}

_source_qlog

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}" ; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_qlog
}

build() {
  cd "$_pkgsrc"
  qmake6 PREFIX="$pkgdir/usr" QLog.pro
  make
}

package() {
  cd "$_pkgsrc"
  make install
}
