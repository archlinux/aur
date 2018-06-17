# Maintainer: Davide Depau <davide@depau.eu>

pkgname=gst-plugin-viperfx-git
pkgver=r2.227da1f
pkgrel=1
pkgdesc="ViPER FX core wrapper plugin for GStreamer1"
url="https://github.com/vipersaudio/gst-plugin-viperfx"
arch=("x86_64")
license=("custom")
provides=("gst-plugin-viperfx")
conflicts=("gst-plugin-viperfx")
depends=("libviperfx" "gstreamer")
source=(
	"$pkgname::git+https://github.com/vipersaudio/gst-plugin-viperfx.git"
	"0001-Set-license-to-a-gst-supported-one.patch"
)
sha256sums=('SKIP'
            '3f56f4b2bea7af80309b0ea668877d6fb028677aab966eb946ba4463dd118eea')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < $srcdir/0001-Set-license-to-a-gst-supported-one.patch
} 

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  make
}

package() {
	install -Dm755 "$srcdir/$pkgname/src/.libs/libgstviperfx.so" "$pkgdir/usr/lib/gstreamer-1.0/libgstviperfx.so"
}
