# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
pkgname=libva-v4l2-request-git
pkgver=2019.03.r9.ga3c2476
pkgrel=1
pkgdesc="LibVA implementation for the Linux Video4Linux2 Request API"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/bootlin/libva-v4l2-request"
license=('LGPL2.1' 'MIT')
depends=('libva>=2.1.0' 'libdrm>=2.4.52')
provides=(libva-v4l2-request v4l2_request_drv_video.so)
conflicts=(libva-v4l2-request)
makedepends=(git patch meson)
source=("$pkgname::git+https://github.com/bootlin/libva-v4l2-request.git"
	'https://github.com/bootlin/libva-v4l2-request/pull/38.patch'
	'0002-Discard-Sunxi-tiled-NV12-YUV-if-non-__arm__.patch')
sha256sums=('SKIP'
            '6dd6cd65604bafe542a15104683674660cd96311ab677cf78372f72e1379d5a0'
            '20aa3fce9b058b7bc5e9d013df5e72b38171c3f203e1e3cc3fb841f32bde2112')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
 cd "$pkgname"
 patch -p1 -i "$srcdir/38.patch"
 patch -p1 -i "$srcdir/0002-Discard-Sunxi-tiled-NV12-YUV-if-non-__arm__.patch"
}

build() {
  meson --prefix /usr --buildtype=plain $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
