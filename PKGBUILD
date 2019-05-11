# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=libdbuslog
pkgbase="${_pkgname}-git"
pkgname=(
  "${_pkgname}-tools-git"
  "${_pkgname}server-common-git"
  "${_pkgname}server-dbus-git"
  "${_pkgname}server-gio-git"
)
pkgver=1.0.15.r0.gd0dbccb
pkgrel=2
pkgdesc="D-Bus based logging"
arch=('i686' 'x86_64')
depends=('glib2' 'dbus' 'libglibutil' 'libdbusaccess')
makedepends=('git' 'make')
url="https://git.sailfishos.org/mer-core/libdbuslog"
license=('BSD')
source=(${_pkgname}::git+https://git.sailfishos.org/mer-core/libdbuslog.git)
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  _tmpdir="$srcdir/package"

  msg2 "Building client tools..."
  
  # Dirty workaround: make seems to fail to build first time for some reason I
  # can't figure out. Running it twice seems to fix it
  make -C tools/dbuslog-client KEEP_SYMBOLS=1 release || make -C tools/dbuslog-client KEEP_SYMBOLS=1 release

  msg2 "Building server..."
  make -C server KEEP_SYMBOLS=1 release pkgconfig
  
  msg2 "Preparing files for packaging..."
  make -C tools/dbuslog-client install DESTDIR="${_tmpdir}"
  make -C server install DESTDIR=${_tmpdir}
}

package_libdbuslog-tools-git() {
  pkgdesc="Command line client for libdbuslogserver"
  depends+=()
  provides=("libdbuslog-tools")
  conflicts=("libdbuslog-tools")

  cd "$srcdir/package"
  
  install -Dm755 "usr/bin/dbuslog-client" "$pkgdir/usr/bin/dbuslog-client"
}

package_libdbuslogserver-common-git() {
  pkgdesc="Common development headers for libdbuslogserver"
  depends+=()
  provides=("libdbuslogserver-common")
  conflicts=("libdbuslogserver-common")

  cd "$srcdir/package"

  ls "usr/include/dbuslogserver" | grep '\.h$' | while read header; do
    install -Dm644 "usr/include/dbuslogserver/$header" "$pkgdir/usr/include/dbuslogserver/$header"
  done
}

_package_server() {
  cd "$srcdir/package"

  # Install libraries
  find "usr/lib" -maxdepth 1 -type f | grep '/libdbuslogserver-'"$1"'\.so' | while read lib; do
    install -Dm755 "$lib" "$pkgdir/$lib"
  done
  
  # Copy links
  find "usr/lib" -maxdepth 1 -type l | grep '/libdbuslogserver-'"$1"'\.so' | while read lib; do
    cp -d "$lib" "$pkgdir/$lib"
  done
  
  ls "usr/include/dbuslogserver/$1" | grep '\.h$' | while read header; do
    install -Dm644 "usr/include/dbuslogserver/$1/$header" "$pkgdir/usr/include/dbuslogserver/$1/$header"
  done
  
  install -Dm644 "usr/lib/pkgconfig/libdbuslogserver-$1.pc" "$pkgdir/usr/lib/pkgconfig/libdbuslogserver-$1.pc"
}

package_libdbuslogserver-dbus-git() {
  pkgdesc="Library of logging utilities for libdbus based programs"
  depends+=(
    "libdbuslogserver-common"
  )
  provides=("libdbuslogserver-dbus")
  conflicts=("libdbuslogserver-dbus")

  _package_server dbus
}

package_libdbuslogserver-gio-git() {
  pkgdesc="Library of logging utilities for gio based programs"
  depends+=(
    "libdbuslogserver-common"
  )
  provides=("libdbuslogserver-gio")
  conflicts=("libdbuslogserver-gio")

  _package_server gio
}
