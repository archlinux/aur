# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.4.1
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
  "systemd.service"
)
sha256sums=('ebc30213ae85716d5a57e30b912f083b2fdb374a793d5adfec00a064fdfc165c'
            'SKIP'
            '6d29178697384fb046d9d25c6c2482f353a4484ec4f0a5b9080d1a26aa24f839')

validpgpkeys=('108BF2212A051F4A72B18448B3C7CE210DE76DFC')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "SystemdService=pithos.service" >> "data/io.github.Pithos.service.in"
}

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
  install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/user/pithos.service"
}
