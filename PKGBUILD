# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Contributor: Christopher Eby <kreed@kreed.org>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=pithos
pkgver=1.6.1
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'python-systemd: Logging to the system journal')
makedepends=('meson' 'appstream-glib')
source=(
  "https://github.com/pithos/pithos/releases/download/${pkgver}/pithos-${pkgver}.tar.xz"
  "systemd.service"
)
sha256sums=('02c7c18951d9760f54f3de0313a37273778779101bfe58bdc273a0e113f2ce2d'
            '6d29178697384fb046d9d25c6c2482f353a4484ec4f0a5b9080d1a26aa24f839')

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
