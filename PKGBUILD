# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/archlinux-pkgbuild

# Uncomment, if you want tha last release
_version=2.2.2

pkgname=owncloud-client-git
pkgver=2.2.2
pkgrel=1
pkgdesc="ownCloud client based on mirall"
arch=('i686' 'x86_64')
url="http://owncloud.org/"
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=()
makedepends=('cmake' 'qt5-tools')
provides=('mirall' 'mirall-git' 'owncloud-client')
conflicts=('mirall-git' 'owncloud-client' 'owncloud-client-ngs')
install=${pkgname}.install
options=(!strip)
backup=('etc/ownCloud/sync-exclude.lst')
_client=client
source=("${_client}::git+https://github.com/owncloud/client.git")
md5sums=('SKIP')

pkgver() {
  if [[ -z "${_version}" ]]; then
    cd ${srcdir}/${_client}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  else
    echo ${_version}
  fi
}

prepare() {
  if [[ -n "${_version}" ]]; then
    cd ${srcdir}/${_client}
    git checkout "v${_version}"
    git submodule update --init
  fi
}

build() {
  cd ${srcdir}/${_client}

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DWITH_DOC=FALSE \
	-DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        ../${_client}
  make
}

package() {
  cd ${srcdir}/${_client}
  make DESTDIR=${pkgdir} install
}
