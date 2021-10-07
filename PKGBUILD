# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kyle Laker <kyle@laker.email>
pkgname=warpinator-git
_desktop_id=org.x.Warpinator
pkgver=1.2.4.r9.gc55eadc
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('any')
url="https://github.com/linuxmint/warpinator"
license=('GPL3')
depends=('gtk3' 'lshw' 'python-cryptography' 'python-gobject' 'python-grpcio'
         'python-netaddr' 'python-netifaces' 'python-protobuf' 'python-pynacl'
         'python-setproctitle' 'python-setuptools' 'python-zeroconf' 'python-xapp' 'xapps')
makedepends=('git' 'meson' 'polkit')
checkdepends=('appstream')
optdepends=('ufw: Configure firewall rules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/warpinator.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Fix hard-coded libexec dir
  sed -i 's/libexec/lib/g' \
    "bin/${pkgname%-git}.in" \
    "data/org.x.${pkgname%-git}.policy.in.in" \
    install-scripts/download_zeroconf.py
  sed -i 's/@libexecdir@/@libdir@/g' src/config.py.in
}

build() {
  arch-meson  "${pkgname%-git}" build -Dbundle-zeroconf=false
  meson compile -C build
}


check() {

# No tests defined
#  meson test -C build --print-errorlogs

  desktop-file-validate build/data/${_desktop_id}.desktop
  appstreamcli validate build/data/${_desktop_id}.appdata.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
