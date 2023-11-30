# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Kyle Laker <kyle@laker.email>
pkgname=warpinator-git
_desktop_id=org.x.Warpinator
pkgver=1.8.0.r0.gc3da064c
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('any')
url="https://github.com/linuxmint/warpinator"
license=('GPL3')
depends=(
  'gtk3'
  'libnm'
  'python-cairo'
  'python-cryptography'
  'python-gobject'
  'python-grpcio'
  'python-landlock'
  'python-netifaces'
  'python-packaging'
  'python-protobuf'
  'python-pynacl'
  'python-setproctitle'
  'python-setuptools'
  'python-zeroconf'
  'python-xapp'
  'xapps'
)
makedepends=('cython' 'git' 'meson' 'polkit')
checkdepends=('appstream-glib')
optdepends=('ufw: Configure firewall rules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/warpinator.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --exclude master* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Fix hard-coded libexec dir
  find . -type f -exec sed -i 's/libexec/lib/g' {} \;
  find . -type f -exec sed -i 's/@libexecdir@/@libdir@/g' {} \;
}

build() {
  arch-meson  "${pkgname%-git}" build \
    -Dbundle-zeroconf=false \
    -Dbundle-grpc=false \
    -Dbundle-landlock=false
  meson compile -C build
}


check() {
  desktop-file-validate "build/data/${_desktop_id}.desktop"
  desktop-file-validate "$srcdir/${pkgname%-git}/data/${pkgname%-git}-autostart.desktop"
  appstream-util validate --nonet "build/data/${_desktop_id}.appdata.xml"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
