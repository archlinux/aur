# Maintainer : Jimmy Stelzer <jimmy dot stelzer at gmail dot com> [AUR: jimmy.stelzer]

pkgname=xfce4-hardware-monitor-plugin
pkgver=1.6.0
pkgrel=2
pkgdesc="Plugin for the Xfce4 panel that lets you monitor CPU usage, network bandwith, etc."
arch=('i686' 'x86_64')
provides=('xfce4-hardware-monitor-plugin')
url=http://git.xfce.org/panel-plugins/xfce4-hardware-monitor-plugin/
depends=('lm_sensors' 'gtkmm' 'libglademm' 'libgnomecanvasmm' 'libgtop' \
        'libxfce4ui' 'xfce4-panel')
makedepends=('autoconf-archive' 'intltool' 'git' 'xfce4-dev-tools')
license=('GPL3')
source=("git+https://git.xfce.org/panel-plugins/xfce4-hardware-monitor-plugin#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i '/c++11/d' configure.ac
  sed -i '/gnu++11/d' configure.ac
  sed -i 's/AM_PROG_AR/AM_PROG_AR\nAX_CHECK_COMPILE_FLAG([-std=c++11], [CXXFLAGS="$CXXFLAGS -std=c++11"])/' configure.ac
  sed -i 's/AM_PROG_AR/AM_PROG_AR\nAX_CHECK_COMPILE_FLAG([-std=gnu++11], [CXXFLAGS="$CXXFLAGS -std=gnu++11"])/' configure.ac

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR=${pkgdir} install
}
