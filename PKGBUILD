# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.4.0
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
makedepends=('meson' 'appstream-glib')
source=(
  "https://github.com/pithos/pithos/releases/download/${pkgver}/pithos-${pkgver}.tar.xz"{,.asc}
  "dbus.service"
  "systemd.service"
)
sha256sums=('4c025d7e1e055292849b80c37d8ad3862e0f2cbd9c7327664deb8ac0389952ac'
            'SKIP'
            '2b80c9bb84f7de8de0e36dc16465c6633cb74de7bf777efcad76393e88a6e62a'
            '6d29178697384fb046d9d25c6c2482f353a4484ec4f0a5b9080d1a26aa24f839')

validpgpkeys=('108BF2212A051F4A72B18448B3C7CE210DE76DFC')

build() {
  cd "${srcdir}"
  if [[ -d ./build/ ]]; then
         rm -rf ./build/
  fi
  mkdir build
  meson "${pkgname}-${pkgver}" build --prefix=/usr
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install
  install -Dm644 "${srcdir}/dbus.service" "${pkgdir}/usr/share/dbus-1/services/io.github.Pithos.service"
  install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/user/pithos.service"
}
