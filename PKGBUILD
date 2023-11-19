# Maintainer:
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_pkgname=qlog
pkgname="$_pkgname-git"
pkgver=0.29.2.r0.ge44fc85
pkgrel=1
pkgdesc="Amateur radio logbook software"
arch=("x86_64" "i686")
url="https://github.com/foldynl/QLog"
license=('GPL')

depends=(
  'qt6-base'
  'qt6-charts'
  'qt6-serialport'
  'qt6-webengine'
  'qtkeychain-qt6'
  'hamlib'
)
makedepends=(
  'git'
  'qt6-tools'
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
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['foldynl.qlog-flags']='res/flags'
    )
    _submodule_update
  )
}

_source_qlog

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
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
