# Maintainer: Tab Fitts <tfitts [at] spryservers [dot] net>
# Git: https://github.com/SpryServers/sprycloud-desktop
# Uncomment, if you want the last release
#_version=sprycloud_master
_spryrel=2.6.1.spry.r1
pkgname=sprycloud-client-git
_name=${pkgname/\-git/}
pkgver=2.6.1.spry.r1.r0.g2b5d0de83
pkgrel=1
pkgdesc="spryCloud client for Linux"
arch=('i686' 'x86_64')
url="https://www.spryservers.net/"
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'qt5-webengine' 'hicolor-icon-theme' 'xdg-utils' 'openssl')
optdepends=('nemo-python' 'python2-nautilus' 'python-sphinx' 'doxygen')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'doxygen' 'qtkeychain' 'python-sphinx')
provides=('sprycloud-client' 'sprycloud-client-git')
conflicts=('sprycloud-client')
install=${_name}.install
options=(!strip)
backup=('etc/spryCloud/sync-exclude.lst')
source=("${_name}::git+https://github.com/SpryServers/sprycloud-desktop.git")
md5sums=('SKIP')

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
        -DNO_SHIBBOLETH=1 \
        -DMIRALL_VERSION_SUFFIX=-spry-r1 \
        -DMIRALL_VERSION_BUILD=${pkgrel} \
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
}
