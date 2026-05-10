# Maintainer: Pedrojok01 <pedrojok@pm.me>
pkgname=linux-broadcast-bin
_pkgname=linux-broadcast
pkgver=0.1.2
pkgrel=1
pkgdesc="Background-replacement virtual webcam for Linux (MediaPipe / RVM via ONNX Runtime)"
arch=('x86_64')
url="https://github.com/Pedrojok01/linux-broadcast"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-libav'
  'gtk3'
  'libayatana-appindicator'
  'v4l2loopback-dkms'
)
optdepends=(
  'pipewire: pipewiresrc support if you swap GStreamer source backends'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')
options=('!strip')

package() {
  cd "$srcdir"
  bsdtar -xf "$_pkgname-$pkgver.deb"
  # cargo-deb may compress data.tar with xz or zst; try both.
  if [ -f data.tar.zst ]; then
    bsdtar -xf data.tar.zst -C "$pkgdir"
  elif [ -f data.tar.xz ]; then
    bsdtar -xf data.tar.xz -C "$pkgdir"
  else
    bsdtar -xf data.tar.* -C "$pkgdir"
  fi

  # Move Debian's copyright file to Arch's licenses path.
  if [ -f "$pkgdir/usr/share/doc/$_pkgname/copyright" ]; then
    install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
    mv "$pkgdir/usr/share/doc/$_pkgname/copyright" \
       "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    rmdir "$pkgdir/usr/share/doc/$_pkgname" 2>/dev/null || true
    rmdir "$pkgdir/usr/share/doc" 2>/dev/null || true
  fi
}
