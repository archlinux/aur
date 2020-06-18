# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-system-monitor-git
pkgver=5.6.5.r0.g2f0ce74
pkgrel=1
pkgdesc='A more user-friendly system monitor'
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-system-monitor"
license=('GPL3')
depends=('deepin-qt5integration' 'dtkwm' 'procps-ng' 'nethogs' 'libcap')
makedepends=('deepin-gettext-tools' 'qt5-tools')
groups=('deepin')
install=deepin-system-monitor.install
source=("git+https://github.com/linuxdeepin/deepin-system-monitor"
        qt-5.14.patch
        deepin-system-monitor-qt5.15.patch)
sha512sums=('SKIP'
            '423e6b528ac0e63986aedbac3f2065b985945f38a54fe3e818b841154b846d67379cac470c8e22c06d449a79cf2e7f29a007358adf4f86918d1078b789e1e612'
            '45f9938885c6e29abf61174db3bc5654646baa7a8ec067ee4e048511eb62ae79996976c02d9275e8fdf1a7321dd0219b58ae54d8d370c5acf8346dd77959c608')


pkgver() {
  cd "deepin-system-monitor"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd deepin-system-monitor
  patch -p1 -i ../qt-5.14.patch
  patch -p1 -i ../deepin-system-monitor-qt5.15.patch # Fix build with Qt 5.15
  sed -i '/<QPixmap>/a #include <QUrl>' src/process/stats_collector.cpp

  rm -r 3rdparty
  sed -i 's|error("Build nethogs static library failed.")||' deepin-system-monitor.pro

  sed -i 's/nethogsmonitor_loop(&onNethogsUpdate);/nethogsmonitor_loop(\&onNethogsUpdate, NULL, 1000);/' src/network_traffic_filter.cpp

# Workaround build failure with GCC 10
  sed -e 's|print_err|print_err_system|g' -i src/process/system_stat.cpp
  sed -e 's|print_err|print_err_process|g' -i src/process/process_stat.cpp
  sed -e 's|print_err|print_err_desktop|g' -i src/process/desktop_entry_stat.cpp
}

build() {
  cd deepin-system-monitor
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd deepin-system-monitor
  make INSTALL_ROOT="$pkgdir" install
}
