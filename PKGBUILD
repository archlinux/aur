# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Maintainer: Steven Allen <steven@stebalien.com>

_pkgname=pithos
pkgname=$_pkgname-git
pkgver=1.3.1.r36.gc584d2d
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'python-systemd: Logging to the system journal')
makedepends=('git' 'meson' 'appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname-bzr" "$_pkgname")
sha256sums=('SKIP'
            '2b80c9bb84f7de8de0e36dc16465c6633cb74de7bf777efcad76393e88a6e62a'
            '6d29178697384fb046d9d25c6c2482f353a4484ec4f0a5b9080d1a26aa24f839')
source=('git+https://github.com/pithos/pithos.git'
        'dbus.service'
        'systemd.service')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
  cd "$srcdir"
  if [[ -d ./build/ ]]; then
         rm -rf ./build/
  fi
  mkdir build
  meson "$_pkgname" build --prefix=/usr
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir" ninja install
  install -Dm644 "${srcdir}/dbus.service" "${pkgdir}/usr/share/dbus-1/services/io.github.Pithos.service"
  install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/user/pithos.service"
}
