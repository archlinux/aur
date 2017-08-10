# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=touchpad-indicator
pkgname=${_pkgname}-bzr
pkgver=1.0.4.r92
pkgrel=1
pkgdesc='A simple indicator for controlling a synaptics touchpad'
arch=('i686' 'x86_64')
url='https://launchpad.net/touchpad-indicator'
license=('GPL3')
depends=('libappindicator-gtk3' 'python-requests' 'libnotify' 'xf86-input-synaptics')
makedepends=('bzr' 'python2-distutils-extra' 'python2-polib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::bzr+https://code.launchpad.net/~lorenzo-carbonell/touchpad-indicator/0.9")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$( head -1 debian/changelog | grep -E -o  '([0-9]+)+(\.[0-9]+)*' | head -1 ).r$( bzr revno )"
}

prepare() {
  cd "${_pkgname}"

  # Don't install to /opt and install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:/opt/extras.ubuntu.com/touchpad-indicator:/usr:g' \
           -e 's:locale-langpack:locale:g' '{}' \;
}

build() {
  cd "${_pkgname}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  
  mv "${pkgdir}"/usr/share/applications/extras-touchpad-indicator.desktop \
    "${pkgdir}"/usr/share/applications/touchpad-indicator.desktop
}
