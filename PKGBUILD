# Maintainer:
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Danilo Kuehn <dk at nogo-software dot de>

_pkgname="nextcloud-client"
pkgname="$_pkgname-git"
pkgver=3.10.1.r224.gbfb016c28
pkgrel=1
pkgdesc="Nextloud client for linux"
#url="https://nextcloud.com/"
url="https://github.com/nextcloud/desktop"
license=('GPL2')
arch=('i686' 'x86_64')

depends=(
  inkscape
  karchive5
  libcloudproviders
  openssl
  qt5-graphicaleffects
  qt5-quickcontrols2
  qt5-svg
  qt5-webengine
  qt5-webkit
  qt5-websockets
  qtkeychain-qt5
  sqlite
  xdg-utils
)
makedepends=(
  cmocka
  doxygen
  extra-cmake-modules
  git
  python-sphinx
  qt5-tools
)
optdepends=(
  'kio5: integration with Dolphin'
  'nemo-python: integration with Nemo'
  'python-caja: integration with Caja'
  'python-nautilus: integration with Nautilus'
)
provides=('mirall' 'mirall-git' 'owncloud-client' 'nextcloud-client')
conflicts=('mirall-git' 'owncloud-client' 'owncloud-client-ngs' 'nextcloud-client' 'owncloud-client-git')
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

  local _file='VERSION.cmake'

  local _ver_major=$(
    grep -E 'MIRALL_VERSION_MAJOR\s+([0-9]+)' "$_file" \
      | sed -E 's@^.*MIRALL_VERSION_MAJOR\s+([0-9]+).*$@\1@'
  )
  local _ver_minor=$(
    grep -E 'MIRALL_VERSION_MINOR\s+([0-9]+)' "$_file" \
      | sed -E 's@^.*MIRALL_VERSION_MINOR\s+([0-9]+).*$@\1@'
  )
  local _version=$(
    git tag -l "v${_ver_major:?}.${_ver_minor:?}.[0-9]" | sort -h | tail -1
  )
  local _revision=$(
    git rev-list --count ${_version:?}..HEAD
  )
  local _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "${_version#v}" \
    "${_revision:?}" \
    "${_hash:?}"
}

_prepare_nextcloud_client() (
  cd "${srcdir:?}/$_pkgsrc"
  local -A _submodules=(
    ['dschmidt.libcrashreporter-qt']='src/3rdparty/libcrashreporter-qt'
  )
  _submodule_update
)

prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_nextcloud_client
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DWITH_DOC=FALSE
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
