# Maintainer: Eldin Beganovic <franklyn@htl-leonding.ac.at>
# Contributor: Franklyn Team <franklyn@htl-leonding.ac.at>

pkgname=franklyn-bin
_pkgname=franklyn-sentinel
pkgver=0.9.7
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
sha256sums_x86_64=('5e2b8a1828504f20aaff5a763329387f9b10c20b6c757d5c7dd10a62ea1e718a')
sha256sums_aarch64=('6e22a79e25c1cd8ab42472a14e060b5eabb55fe85f55de72e75ca69289d619ba')

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
