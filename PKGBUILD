# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/archlinux-pkgbuild

# Uncomment, if you want tha last release
_version=2.3.3

pkgname=nextcloud-client-git
_name=${pkgname/\-git/}
pkgver=2.3.3
pkgrel=1
pkgdesc="Nextloud client for linux"
arch=('i686' 'x86_64')
url="https://nextcloud.com/"
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=(
  'python2-nautilus: integration with Nautilus'
  'nemo-python: integration with Nemo'
)
makedepends=('cmake' 'qt5-tools')
provides=('mirall' 'mirall-git' 'owncloud-client' 'nextcloud-client')
conflicts=('mirall-git' 'owncloud-client' 'owncloud-client-ngs' 'nextcloud-client' 'owncloud-client-git')
install=${_name}.install
options=(!strip)
backup=('etc/Nextcloud/sync-exclude.lst')
source=(
  "${_name}::git+https://github.com/nextcloud/client_theming.git"
  "${_name}.service"
)
sha256sums=(
  'SKIP'
  '590d44296e12dd4389dc2bbd100b1f680f5ef6dee381469748525fd34af32009'
)

pkgver() {
  if [[ -z "${_version}" ]]; then
    cd ${srcdir}/${_name}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  else
    echo ${_version}
  fi
}

prepare() {
  cd ${srcdir}/${_name}
  if [[ -n "${_version}" ]]; then
    git checkout "v${_version}"
  fi
  git submodule update --init --recursive
  mkdir -p ${srcdir}/${_name}/build-linux
}

build() {
  cd ${srcdir}/${_name}/build-linux

  cmake -D OEM_THEME_DIR=${srcdir}/${_name}/nextcloudtheme \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${_name} \
        -DWITH_DOC=FALSE \
        ../client

  make
}

package() {
  cd ${srcdir}/${_name}/build-linux
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/${_name}.service ${pkgdir}/usr/lib/systemd/user/${_name}.service

  # Fix some naming issues
  if [ -f ${pkgdir}/usr/share/applications/nextcloud.desktop ]; then
    sed -Ei 's/Icon(\[.*\])?=nextcloud/Icon\1=Nextcloud/g' ${pkgdir}/usr/share/applications/nextcloud.desktop
    mv ${pkgdir}/usr/share/applications/nextcloud.desktop ${pkgdir}/usr/share/applications/Nextcloud.desktop
  fi
}
