# Maintainer:
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_pkgname="qlog"
pkgname="$_pkgname-git"
pkgver=0.44.1.r0.g79625cf
pkgrel=1
pkgdesc="Amateur radio logbook software"
url="https://github.com/foldynl/QLog"
license=('GPL-3.0-or-later')
arch=("x86_64" "i686")

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

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_qlog() {
  local _sources_add=(
    'foldynl.qlog-flags'::'git+https://github.com/foldynl/QLog-Flags.git'::'res/flags'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_qlog() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_main
_source_qlog

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_qlog
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

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
