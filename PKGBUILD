# Maintainer: Aleš Dvoršak (AUR: elabjer)

pkgname=studio-one-8
pkgver=8.2.1.115414
pkgrel=1
pkgdesc='Fender Studio Pro 8 digital audio workstation (formerly PreSonus Studio One)'
arch=('x86_64')
url='https://www.fender.com/redirects/studiopro_product_page'
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'avahi'
  'ffmpeg'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'jack'
  'libglvnd'
  'libunistring'
  'libxkbcommon'
  'openssl'
  'sdbus-cpp'
  'util-linux-libs'
  'vulkan-icd-loader'
  'wayland'
)
provides=(
  'studiopro8'
  'studioapp'
  'vst-host'
  'vst3-host'
  'clap-host'
)
conflicts=(
  'studiopro8'
)
options=('!strip')
source=('studio-one-8.sh')
source_x86_64=(
  "studiopro8-${pkgver}.deb::https://studioone-content-r2.presonusmusic.com/studiopro/821RC1IMP8CT/studiopro8-${CARCH}.deb"
  "ffmpeg8-8.1.2-10-${CARCH}.pkg.tar.zst::https://archive.archlinux.org/packages/f/ffmpeg/ffmpeg-2%3A8.1.2-10-${CARCH}.pkg.tar.zst"
  "x265-4.2-2-${CARCH}.pkg.tar.zst::https://archive.archlinux.org/packages/x/x265/x265-4.2-2-${CARCH}.pkg.tar.zst"
  "libbluray-1.4.1-1-${CARCH}.pkg.tar.zst::https://archive.archlinux.org/packages/l/libbluray/libbluray-1.4.1-1-${CARCH}.pkg.tar.zst"
)
noextract=(
  "studiopro8-${pkgver}.deb"
  "ffmpeg8-8.1.2-10-${CARCH}.pkg.tar.zst"
  "x265-4.2-2-${CARCH}.pkg.tar.zst"
  "libbluray-1.4.1-1-${CARCH}.pkg.tar.zst"
)
sha256sums=('1840eafebe28cb020c14ccf7d6947ba75559a72d9da5abe793ffc0e5539032c2')
sha256sums_x86_64=(
  '767f5129af9bc6646900bc75b426281b35bd5a685530e7423ad206a9575fac36'
  'a62451d12a395b95f4c15fb17b911367a97767a84ec2d86a596e0e603cf19fb7'
  'b45049a2d75051af6d2abd4b643d246a03d3f0e4ae466bfe800ec38cfe558b8f'
  'cc41033e93382c2529d23f8cdbe776385a6f3f409769198e7589d2058fca8853'
)

prepare() {
  rm -rf "$srcdir/deb-container" "$srcdir/deb-data" "$srcdir/compat-libs"
  mkdir -p "$srcdir/deb-container" "$srcdir/deb-data" "$srcdir/compat-libs"

  bsdtar -xf "$srcdir/studiopro8-${pkgver}.deb" -C "$srcdir/deb-container"
  bsdtar -xf "$srcdir/deb-container/data.tar.gz" -C "$srcdir/deb-data"

  bsdtar -xf "$srcdir/ffmpeg8-8.1.2-10-${CARCH}.pkg.tar.zst" \
    -C "$srcdir/compat-libs" \
    'usr/lib/libavcodec.so.62*' \
    'usr/lib/libavformat.so.62*' \
    'usr/lib/libavutil.so.60*' \
    'usr/lib/libswresample.so.6*' \
    'usr/lib/libswscale.so.9*'

  bsdtar -xf "$srcdir/x265-4.2-2-${CARCH}.pkg.tar.zst" \
    -C "$srcdir/compat-libs" \
    'usr/lib/libx265.so.216'

  bsdtar -xf "$srcdir/libbluray-1.4.1-1-${CARCH}.pkg.tar.zst" \
    -C "$srcdir/compat-libs" \
    'usr/lib/libbluray.so.3' \
    'usr/lib/libbluray.so.3.1.0'
}

package() {
  cp -a --no-preserve=ownership "$srcdir/deb-data/." "$pkgdir/"

  install -Dm755 "$srcdir/studio-one-8.sh" \
    "$pkgdir/usr/bin/studio-one-8"

  install -d "$pkgdir/opt/Fender/Studio Pro 8/lib/ffmpeg8"
  cp -a --no-preserve=ownership "$srcdir/compat-libs/usr/lib/." \
    "$pkgdir/opt/Fender/Studio Pro 8/lib/ffmpeg8/"

  sed -i \
    's|^Exec=.*|Exec=/usr/bin/studio-one-8 %u|' \
    "$pkgdir/usr/share/applications/com.fender.studioapp8.desktop"

  install -Dm644 "$pkgdir/opt/Fender/Studio Pro 8/license/EULA.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}
