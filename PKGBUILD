# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=wscreensavers
pkgver=1.0.10
pkgrel=1
pkgdesc="Native Wayland version of XScreenSaver with 22 built-in WebGL/Canvas ports, XScreenSaver XML bridge, PAM lock screen, and live desktop wallpaper mode"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisfair/wscreensavers"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'gtk-layer-shell' 'pam' 'xscreensaver' 'xorg-server-xvfb' 'ffmpeg')
optdepends=(
  'rss-glx: Really Slick Screensavers 3D OpenGL collection'
  'wlr-randr: Multi-monitor output detection on wlroots compositors'
  'hyprlock: Optional external Wayland lock provider'
  'swaylock: Optional external Wayland lock provider'
)
makedepends=('go' 'nodejs' 'npm' 'pkgconf')
provides=('wscreensavers')
conflicts=('wscreensavers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrisfair/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e7d22fd47f58588d6af03db82601eb7f5051c3c370d7c712609472f72cdfd21')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  make build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
