# Maintainer: Eldin Beganovic <franklyn@htl-leonding.ac.at>
# Contributor: Franklyn Team <franklyn@htl-leonding.ac.at>

pkgname=franklyn-bin
_pkgname=franklyn-sentinel
pkgver=0.10.1
pkgrel=1
pkgdesc='Franklyn Sentinel - streams student screen activity to the teacher during exams'
arch=('x86_64' 'aarch64')
url='https://github.com/2526-4ahitm-itp/2526-4ahitm-franklyn'
license=('MIT')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'openssl'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugin-pipewire'
)
optdepends=(
  'xdg-desktop-portal: screen capture on Wayland (plus a backend such as xdg-desktop-portal-gnome/-kde/-hyprland/-wlr)'
)
provides=('franklyn' "$_pkgname")
conflicts=('franklyn' "$_pkgname" 'franklyn-bin-dev')
options=('!strip' '!debug')

_release="$url/releases/download/v$pkgver"
_dist="$_pkgname-$pkgver-$CARCH-linux-dist.tar.zst"

source=("$_pkgname-$pkgver.desktop::https://raw.githubusercontent.com/2526-4ahitm-itp/2526-4ahitm-franklyn/v$pkgver/sentinel/resources/franklyn-sentinel.desktop")
source_x86_64=("$_release/$_pkgname-$pkgver-x86_64-linux-dist.tar.zst")
source_aarch64=("$_release/$_pkgname-$pkgver-aarch64-linux-dist.tar.zst")
noextract=("$_dist")

sha256sums=('8e92bd7fda5283e189f6163c88fae59f922a72df5de47c39c233c7e9ee6acae4')
sha256sums_x86_64=('8500a74ded06530baf1e6de423ca1396b8013dc92440ced4ab5c4258fd1114f9')
sha256sums_aarch64=('06af5f53cce9781ba1cb1611a480e9b5c6216bd6168730a3aa626f612fe5294b')

prepare() {
  if [[ -d dist ]]; then
    chmod -R u+w dist
    rm -rf dist
  fi
  mkdir dist
  bsdtar -xf "$_dist" -C dist
  chmod -R u+w dist
}

package() {
  cd dist

  install -Dm755 bin/franklyn "$pkgdir/usr/bin/franklyn"

  find share/icons -type f -name '*.png' -exec install -Dm644 {} "$pkgdir/usr/{}" \;

  sed -e "s|@BINARY_PATH@|/usr/bin/franklyn|" \
    "$srcdir/$_pkgname-$pkgver.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 GSTREAMER_LICENSE "$pkgdir/usr/share/licenses/$pkgname/GSTREAMER_LICENSE"
}
