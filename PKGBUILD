# Maintainer: Pedrojok01 <pedrojok@pm.me>
pkgname=linux-broadcast-bin
_pkgname=linux-broadcast
pkgver=0.6.0
pkgrel=1
# Debian revision baked into the upstream .deb filename by cargo-deb.
# Unrelated to AUR's pkgrel — bump only if [package.metadata.deb].revision
# changes in crates/app/Cargo.toml.
_debrev=1
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
  'v4l2loopback-dkms'
  'v4l2loopback-utils'
)
optdepends=(
  'pipewire: pipewiresrc support if you swap GStreamer source backends'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-${_debrev}_amd64.deb")
sha256sums=('eeed697b1e8f0f9c23272008c243f9a3bb572ccd973f31cc4de882afb0615af8')
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
