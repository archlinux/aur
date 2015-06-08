# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=kdeplasma-applets-awesome-widgets-git
_pkgname=awesome-widgets
pkgver=2.2.1.r2.ga098c9d
pkgrel=1
pkgdesc="Collection of minimalistic Plasmoids which look like Awesome WM widgets (ex-PyTextMonitor)"
arch=('i686' 'x86_64')
url="http://arcanis.name/projects/awesome-widgets"
license=('GPL3')
depends=('kdebase-workspace' 'lm_sensors')
optdepends=("amarok: for music player monitor"
            "clementine: for music player monitor"
            "catalyst: for GPU monitor"
            "hddtemp: for HDD temperature monitor"
            "smartmontools: for HDD temperature monitor"
            "mpd: for music player monitor"
            "nvidia-utils: for GPU monitor"
            "qmmp: for music player monitor")
makedepends=('automoc4' 'cmake' 'git')
source=(${_pkgname}::git+https://github.com/arcan1s/awesome-widgets.git#branch=release-2.2.1)
install=${pkgname}.install
md5sums=('SKIP')
backup=('usr/share/config/plasma-dataengine-extsysmon.conf')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/V\.//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  rm -rf "${srcdir}/${_pkgname}/build"
  mkdir "${srcdir}/${_pkgname}/build"

  # update submobules
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update --recursive
}


build () {
  cd "${srcdir}/${_pkgname}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        "../sources"
  make
}


package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
