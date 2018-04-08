# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/archlinux-pkgbuild

# Uncomment, if you want the last release
#_version=2.3.3

pkgname=nextcloud-client-git
_name=${pkgname/\-git/}
pkgver=v2.3.3.r15.gb095916
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
options=(!strip)
backup=('etc/Nextcloud/sync-exclude.lst')
source=(
  "${_name}::git+https://github.com/nextcloud/client_theming.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  if [[ -z "${_version}" ]]; then
    cd ${srcdir}/${_name}
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
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

  # Fix some naming issues
  if [ -f ${pkgdir}/usr/share/applications/nextcloud.desktop ]; then
    sed -Ei 's/Icon(\[.*\])?=nextcloud/Icon\1=Nextcloud/g' ${pkgdir}/usr/share/applications/nextcloud.desktop
    mv ${pkgdir}/usr/share/applications/nextcloud.desktop ${pkgdir}/usr/share/applications/Nextcloud.desktop
  fi
}
