# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: galiyosha@gmail.com
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

_name=libffado
pkgname=libffado-svn
pkgver=r2730
pkgrel=1
pkgdesc="Driver for FireWire audio devices (svn version)"
arch=('x86_64')
url="http://www.ffado.org/"
license=('GPL')
depends=('dbus-c++' 'jack' 'libavc1394' 'libconfig' 'libiec61883' 'libxml++' 'python2')
makedepends=('python2-pyqt4' 'scons')
optdepends=('python2-pyqt4: ffado-mixer')
conflicts=('libffado')
provides=('ffado' 'libffado')
source=("${_name}::svn+http://subversion.ffado.org/ffado/trunk/${_name}"
        'python2.patch'
)
sha512sums=('SKIP'
            'b85e49bff25d47936d5ef0feb452c128eab61013fba1b16e8f1caf9e3d875d5b749daa9db0c5275e154e5ff3c874b254e467981b6b28266db5d1b5efa532b911')

pkgver() {
  cd "${_name}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_name}"
  patch -Np1 -i "${srcdir}/python2.patch"
}

build() {
  cd "${_name}"

  scons PREFIX=/usr \
        MANDIR=/usr/share/man \
        UDEVDIR=/usr/lib/udev/rules.d
}

package() {
  cd "${_name}"

  scons DESTDIR="${pkgdir}" WILL_DEAL_WITH_XDG_MYSELF="True" install

  install -Dm644 support/xdg/ffado.org-ffadomixer.desktop \
    "${pkgdir}/usr/share/applications/ffadomixer.desktop"

  install -Dm644 support/xdg/hi64-apps-ffado.png \
    "${pkgdir}/usr/share/pixmaps/hi64-apps-ffado.png"

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
