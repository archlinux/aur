# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='nextcloud-client'
pkgver='2.2.3'
pkgrel='2'
pkgdesc='Nextcloud desktop client'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('extra-cmake-modules' 'python-sphinx' 'qt5-tools' 'doxygen' 'kio')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
conflicts=('owncloud-client')
source=("${pkgname}::git+https://github.com/nextcloud/client_theming.git")
sha256sums=('SKIP')
backup=('etc/Nextcloud/sync-exclude.lst')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init
  cd client
  git submodule update --init

  mkdir "${srcdir}/${pkgname}/build-linux"
}

build() {
  cd "${srcdir}/${pkgname}/build-linux"

  cmake -D OEM_THEME_DIR=${srcdir}/${pkgname}/nextcloudtheme ../client \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname}

  make
  make doc-man
}

package() {
  cd "${srcdir}/${pkgname}/build-linux"
  make DESTDIR="${pkgdir}" install
}
