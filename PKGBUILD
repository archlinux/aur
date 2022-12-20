# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jiezhe Wang <wangjiezhe@gmail.com>

pkgname=battery-stats-git
_pkgname=battery-stats
pkgver=0.5.6.11.g8a42539
pkgrel=2
pkgdesc="Log battery charge, show gnuplot graphs."
arch=('any')
url="https://github.com/petterreinholdtsen/battery-stats.git"
license=('GPLv2')
makedepends=('git' 'cmake')
depends=('bc' 'python-matplotlib' 'gnuplot')
provides=('battery-stats')
conflicts=('battery-stats')
backup=(var/log/${_pkgname})
source=("${_pkgname}::git+https://github.com/petterreinholdtsen/battery-stats.git"
        "battery-stats-collector.service"
        "battery-stats-collector.timer")
sha256sums=('SKIP'
            '8d82053d545532b3b7c646cb9d4e840f160ee9aa2572355a8f218ee43db01e7c'
            '8885fc7512936a918a44a864a0ebc371b0394859132752419414fbbc2383d0f1')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed "s/-/./g"
}

prepare() {
  mkdir -p build
  sed "s/ \/lib/ \${CMAKE_INSTALL_PREFIX}\/lib/" \
      -i ${_pkgname}/data/CMakeLists.txt
  sed "s/sbin/bin/" \
      -i ${_pkgname}/src/CMakeLists.txt
  sed "/set fit quiet/a \\\techo \"set fit logfile '\/dev\/null'\"" \
      -i ${_pkgname}/src/battery-graph.in
}

build() {
  cd build
  cmake ../${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  install -Dm644 battery-stats-collector.service ${pkgdir}/usr/lib/systemd/system/battery-stats-collector.service
  install -Dm644 battery-stats-collector.timer ${pkgdir}/usr/lib/systemd/system/battery-stats-collector.timer
  cd build
  make DESTDIR="${pkgdir}" install
  touch tempfile
  install -Dm644 tempfile ${pkgdir}/var/log/${_pkgname}
}
