# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='nextcloud-client'
pkgver='2.3.1'
pkgrel='1'
pkgdesc='Nextcloud desktop client'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
depends=('qt5-webkit' 'hicolor-icon-theme' 'xdg-utils' 'qtkeychain')
makedepends=('git' 'extra-cmake-modules' 'python-sphinx' 'qt5-tools' 'doxygen' 'qtkeychain')
optdepends=('python2-nautilus: integration with Nautilus'
	    'nemo-python: integration with Nemo'
	    'kio: Resource and network access abstraction (KDE)'
	    'libgnome-keyring: GNOME keyring client')
conflicts=('owncloud-client')
source=("${pkgname}::git+https://github.com/nextcloud/client_theming.git")
sha256sums=('SKIP')
backup=('etc/Nextcloud/sync-exclude.lst')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir -p "${srcdir}/${pkgname}/build-linux"
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

check() {
  sed -Ei 's|Icon(\[.*\])?=nextcloud|Icon\1=Nextcloud|g' "${srcdir}/${pkgname}/build-linux/src/gui/nextcloud.desktop"
}

package() {
  cd "${srcdir}/${pkgname}/build-linux"
  make DESTDIR="${pkgdir}" install
}
