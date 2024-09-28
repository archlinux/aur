# Maintainer: Andreas Hemmerle <andreas.hemmerle@gmail.com>
pkgname=colors-ai
pkgver=2.2.2
pkgrel=1
pkgdesc='AI driven color scheme generator.'
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
url="https://github.com/tsinis/colors_ai"
depends=('curl' 'libsecret' 'mesa' 'pkgconf' 'unzip')
makedepends=('clang' 'cmake>=3.10' 'flutter' 'gendesk' 'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'jsoncpp' 'ninja' 'xz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tsinis/colors_ai/archive/refs/tags/$pkgver.tar.gz")
md5sums=('80019f5c2f818112840f3c5ad2dad2ab')
sha512sums=('ad1856a3158dd37205a7fbcd8dc3117796ec317804f39c85ed6f94b376c4e53fe1954ed6b46b7ec60b56bde146e13efd42fd923f11ba861abab9869ef62459a0')


prepare () {
  cd "$srcdir/colors_ai-$pkgver" || exit 1
  flutter build linux --release

  # start icon
  gendesk -q -n -f --pkgname "$pkgname" --path "/opt/$pkgname/" --pkgdesc "$pkgdesc" --name 'Colors AI' --icon "$pkgname" --categories "Utility;ArtAndDesign" --startupnotify 'true'
  sed -i '/Version/d' "$srcdir/colors_ai-$pkgver/$pkgname.desktop"
}


package () {
  reldir="$srcdir/colors_ai-$pkgver/build/linux/x64/release/bundle"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r "$reldir/lib" "$pkgdir/opt/$pkgname/"
  cp -r "$reldir/data" "$pkgdir/opt/$pkgname/"

  install -Dm755 "$reldir/colors_ai" "$pkgdir/opt/$pkgname/$pkgname"

  install -Dm644 "$srcdir/colors_ai-$pkgver/linux/snap/gui/colors-ai-icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/colors_ai-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
