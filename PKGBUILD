# Maintainer: Tab Fitts <tfitts at spryservers dot net>
# Git: https://github.com/SpryServers/sprycloud-client-arch

# Uncomment, if you want tha last release
#_version=spry_v2.5.0
_spryrel=2.5.0.spry.r6
pkgname=sprycloud-client-git
_name=${pkgname/\-git/}
pkgver=2.5.0.spry.r6.r0.g4414bdce4
pkgrel=2
pkgdesc="spryCloud client for Linux"
arch=('i686' 'x86_64')
url="https://www.spryservers.net/"
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=()
makedepends=('cmake' 'qt5-tools')
provides=('mirall' 'mirall-git' 'sprycloud-client')
conflicts=('sprycloud-client')
install=${_name}.install
options=(!strip)
backup=('etc/spryCloud/sync-exclude.lst')
source=("${_name}::git+https://github.com/SpryServers/sprycloud-client-next.git"
        "${_name}.service")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  if [[ -z "${_version}" ]]; then
    cd "${srcdir}/${_name}"
    git fetch --tags
    git checkout "${_spryrel}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    echo ${_version}
  fi
}

prepare() {
  cd "${srcdir}/${_name}"
  if [[ -n "${_version}" ]]; then
    git checkout "${_version}"
  fi
  git submodule update --init --recursive
  mkdir -p "${srcdir}/${_name}"
}

build() {
  cd "${srcdir}/${_name}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/spryCloud \
        -DWITH_DOC=FALSE \
        -DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        ../${_name}
  make
}

check() {
  sed -Ei 's|Icon(\[.*\])?=sprycloud|Icon\1=spryCloud|g' "${srcdir}/${_name}/src/gui/sprycloud.desktop"
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_name}.service" "${pkgdir}/usr/lib/systemd/user/${_name}.service"
}
