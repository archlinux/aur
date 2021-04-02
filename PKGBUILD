# Maintainer: Tab Fitts <tfitts [at] spryservers [dot] net>
# Git: https://github.com/SpryServers/sprycloud-desktop
# Uncomment, if you want the last release
#_version=master
_spryrel=3.1.3.spry.r1
pkgname=sprycloud-client-git
_name=${pkgname/\-git/}
pkgver=3.1.3.spry.r1.r0.gb222910e0
pkgrel=1
pkgdesc="spryCloud client for Linux"
arch=('i686' 'x86_64')
url="https://www.spryservers.net/"
license=('GPL2')
depends=('openssl' 'sqlite' 'qtkeychain' 'qt5-svg' 'qt5-webengine' 'xdg-utils' 'qt5-websockets' 'qt5-webkit' 'libcloudproviders' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'hicolor-icon-theme')
optdepends=(
    'kio: integration with Dolphin'
    'nemo-python: integration with Nemo'
    'python-nautilus: integration with Nautilus'
    'python-caja: integration with Caja'
    'doxygen: documentation generation'
)
makedepends=('doxygen' 'extra-cmake-modules' 'kio' 'python-sphinx' 'qt5-tools' 'git' 'cmocka')
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
        -DWITH_DOC=FALSE \
        -DNO_SHIBBOLETH=1 \
        -DMIRALL_VERSION_SUFFIX=-spry-r1 \
        -DMIRALL_VERSION_BUILD=${pkgrel} \
        ../${_name}
  make
}

check() {
  sed -Ei 's|Icon(\[.*\])?=sprycloud|Icon\1=spryCloud|g' "${srcdir}/${_name}/src/gui/net.spryservers.sprycloudclient.sprycloud.desktop"
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
}
