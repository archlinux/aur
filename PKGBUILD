# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=wscreensavers
pkgver=1.1.29
pkgrel=1
pkgdesc="Native Wayland version of XScreenSaver with 32 built-in WebGL/Canvas ports, XScreenSaver XML bridge, PAM lock screen, and live desktop wallpaper mode"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisfair/wscreensavers"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'gtk-layer-shell' 'pam' 'xscreensaver' 'xorg-server-xvfb' 'ffmpeg')
optdepends=(
  'celestia: Real-time 3D astronomy engine for Celestia 1.6 Solar System Grand Tour'
  'zource: Native Zig 2D/3D repository history visualizer engine'
  'rss-glx: Really Slick Screensavers 3D OpenGL collection'
  'wlr-randr: Multi-monitor output detection on wlroots compositors'
  'hyprlock: Optional external Wayland lock provider'
  'swaylock: Optional external Wayland lock provider'
)
makedepends=('go' 'nodejs' 'npm' 'pkgconf')
provides=('wscreensavers')
conflicts=('wscreensavers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrisfair/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1da45604002eb3a8bc4b831c2f505e872514a3523c978af93c8bbde3521f289')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  make build SKIP_COVERAGE=1
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
