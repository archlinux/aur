# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Robin Broda <robin@broda.me>

_name='nextcloud-client'
pkgname="${_name}-git-nokde"
pkgver=66.8aade24
pkgrel=1
pkgdesc='Nextcloud desktop client (no kio/dolphin support, with systemd user session service)'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('extra-cmake-modules' 'python-sphinx' 'qt5-tools' 'cmake')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
conflicts=('nextcloud-client' 'nextcloud-client-git')
provides=('mirall' 'mirall-git' 'nextcloud-client' 'nextcloud-client-git')
source=("${_name}::git+https://github.com/nextcloud/client_theming.git" "${_name}.service")
sha256sums=('SKIP' '2dc7fdad6c7577548585e977ba6d148bdb3f35c55b79d05d0043773af09d661e')
backup=('etc/Nextcloud/sync-exclude.lst')

pkgver() {
  if [[ -z "${_version}" ]]; then
    cd ${srcdir}/${_name}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  else
    echo ${_version}
  fi
}

prepare() {
  cd "${srcdir}/${_name}"
  git submodule update --init --recursive
  mkdir -p "${srcdir}/${_name}/build-linux"
}

build() {
  cd "${srcdir}/${_name}/build-linux"

  cmake -D OEM_THEME_DIR=${srcdir}/${_name}/nextcloudtheme ../client \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${_name} \
	-DWITH_DOC=FALSE
  make
}

check() {
  sed -Ei 's|Icon(\[.*\])?=nextcloud|Icon\1=Nextcloud|g' "${srcdir}/${_name}/build-linux/src/gui/nextcloud.desktop"
}

package() {
  cd "${srcdir}/${_name}/build-linux"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/${_name}.service ${pkgdir}/usr/lib/systemd/user/${_name}.service
}
