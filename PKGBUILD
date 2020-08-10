# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-system-monitor-git
pkgver=5.6.12.r1.g91f17ae
pkgrel=1
pkgdesc='A more user-friendly system monitor'
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-system-monitor"
license=('GPL3')
depends=('deepin-qt5integration' 'dtkwm' 'procps-ng' 'libcap')
makedepends=('cmake' 'deepin-gettext-tools' 'ninja' 'qt5-tools')
groups=('deepin')
install=deepin-system-monitor.install
source=("git+https://github.com/linuxdeepin/deepin-system-monitor")
sha512sums=('SKIP')


pkgver() {
  cd "deepin-system-monitor"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd deepin-system-monitor
# Upstream likes to refactor code while ignoring pull requests
  sed -i '20i#include <QMap>\n#include <QHash>\n#include <QPainterPath>' src/compact_memory_monitor.cpp
  sed -i '1i#include <QPainterPath>' src/memory_monitor.cpp src/compact_network_monitor.h \
                                     src/network_monitor.h src/utils.cpp \
                                     src/gui/system_service_page_widget.cpp \
                                     src/gui/process_page_widget.cpp \
                                     src/gui/base_header_view.cpp src/disk_monitor.h \
                                     src/cpu_monitor.h src/compact_disk_monitor.h \
                                     src/compact_cpu_monitor.cpp
# Workaround build failure with GCC 10
  sed -e 's|print_err|print_err_system|g' -i src/process/system_stat.cpp
  sed -e 's|print_err|print_err_process|g' -i src/process/process_stat.cpp
  sed -e 's|print_err|print_err_desktop|g' -i src/process/desktop_entry_stat.cpp
}

build() {
  cd deepin-system-monitor
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd deepin-system-monitor
  DESTDIR="$pkgdir" ninja install
}
