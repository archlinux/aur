# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: galiyosha@gmail.com
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

_name=libffado
pkgname=libffado-svn
pkgver=r2776
pkgrel=1
pkgdesc="Driver for FireWire audio devices (svn version)"
arch=('x86_64')
url="http://www.ffado.org/"
license=('GPL')
depends=('dbus-c++' 'libavc1394' 'libconfig' 'libiec61883' 'libxml++' 'python-dbus')
makedepends=('jack' 'python-pyqt5' 'scons' 'subversion')
optdepends=('alsa-lib: for test-scs'
            'python-pyqt5: for ffado-mixer')
conflicts=('libffado')
provides=('ffado' 'libffado')
source=("${_name}::svn+http://subversion.ffado.org/ffado/trunk/${_name}")
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_name}"
  # fix icon name, so it's coherent with XDG desktop file name
  sed -e 's/hi64-apps-ffado/ffado-mixer/g' \
    -i support/xdg/ffado.org-ffadomixer.desktop
  # removing python2 only code, that breaks, when running scons based on python3
  sed -e 's/split(b/split(/' \
      -e 's/strip().decode()/strip()/' \
      -i SConstruct
}

build() {
  cd "${_name}"

  scons PREFIX=/usr \
        DEBUG=no \
        CUSTOM_ENV=True \
        MANDIR='/usr/share/man' \
        PYTHON_INTERPRETER='/usr/bin/python3' \
        PYPKGDIR='/usr/lib/python3.7/site-packages' \
        UDEVDIR='/usr/lib/udev/rules.d'
}

package() {
  cd "${_name}"
  scons DESTDIR="${pkgdir}" WILL_DEAL_WITH_XDG_MYSELF="True" install
  # XDG
  install -vDm 644 support/xdg/ffado.org-ffadomixer.desktop \
    "${pkgdir}/usr/share/applications/ffado-mixer.desktop"
  install -vDm 644 support/xdg/hi64-apps-ffado.png \
    "${pkgdir}/usr/share/icons/64x64/apps/ffado-mixer.png"
  # docs
  install -vDm 644 {AUTHORS,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
