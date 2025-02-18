# Maintainer:
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Danilo Kuehn <dk at nogo-software dot de>

## links
# https://nextcloud.com/
# https://github.com/nextcloud/desktop

_pkgname="nextcloud-client"
pkgname="$_pkgname-git"
pkgver=3.15.3.r342.g120505b
pkgrel=2
pkgdesc="Nextloud client for linux"
url="https://github.com/nextcloud/desktop"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'karchive'
  'kguiaddons'
  'libcloudproviders'
  'libp11'
  'qt6-5compat'
  'qt6-svg'
  'qt6-webengine'
  'qt6-websockets'
  'qtkeychain-qt6'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kio'
  'qt6-tools'
)
optdepends=(
  'kio: integration with Dolphin'
  'nemo-python: integration with Nemo'
  'python-caja: integration with Caja'
  'python-nautilus: integration with Nautilus'
)

provides=('nextcloud-client' 'nextcloud-client-cloudproviders')
conflicts=('nextcloud-client' 'nextcloud-client-cloudproviders')

backup=('etc/Nextcloud/sync-exclude.lst')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/nextcloud/desktop.git"
  'dschmidt.libcrashreporter-qt'::'git+https://github.com/dschmidt/libcrashreporter-qt.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | grep -Ev '[a-z]{2}' | sort -rV | head -1)
  local _ver="${_tag#v}"
  local _rev=$(git rev-list --count --cherry-pick $_tag...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_ver:?}" "${_rev:?}" "${_hash:?}"
}

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  cd "$srcdir/$_pkgsrc"
  local _submodules=(
    'dschmidt.libcrashreporter-qt'::'src/3rdparty/libcrashreporter-qt'
  )
  _submodule_update
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DPLUGINDIR='lib/qt6/plugins'
    -DBUILD_UPDATER=OFF
    -DWITH_CRASHREPORTER=OFF
    -DUNIT_TESTING=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
