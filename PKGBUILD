# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron, phrakture, Griffin <aaron@archlinux.org>
# Contributor: erkaN kaplaN <erkan@linux-sevenler.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=gwget
pkgver=1.0.4
pkgrel=21
pkgdesc='Download manager application'
arch=(x86_64)
url='https://gitlab.gnome.org/Archive/gwget'
license=(GPL-2.0-or-later)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libnotify
  pango
  wget
)
makedepends=(
  imagemagick
  intltool
)
source=(
  "https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2"
  gwget.appdata.xml
  gwget-1.0.4-notify-0.7.patch
  gwget-1.0.4-glib-2.32.patch
  drop-libgnomeui.patch
  gtk3-port.patch
  hide-window.patch
  wget.patch
  various-fixes.patch
  gsettings-port.patch
)
b2sums=(
  8485aece30496c441d2ddc44dbbe08f17e698cc905ab465fc0b165a70a5ff264da3ef3773cea03ab3cd4e2f48b210d23507d7548549c5880e39d6e5bf955ecd5
  cd853ee74cd42c833f1b8501c40aab5327f463656e98136524f19d2194952410b3537f25ea7218e2d2a712c197263fb141aeb93a97d6fad7a6888f99c5c15eb2
  14371318606059ccd82b10a315df92972059c30d02c2ed251ca562c51b574007a37d6afaebd0cb9acf47583dd5b8e1da1293d94fdf7ded65405d4bf04e3d0f96
  df7ae071201a562ae97a383e1657d9d4b12cccdddb7a91759e5bdfe943214024bff2295603ec0adb04a27ac23bc9e4e59125c2052090a77db18fb25515feeb08
  70175a2b3cc25dfa87dd980d797350a88c972b9d979d21ac2b3620ecdf1717671fddedc9d531d9454236ba57e900d2d5a2464be728d1d234b663757620467380
  a64e1e11c2a8050e9e2d5354764cd5dd186f9c18dd7ed7368eaa5bde9d34929f6cc4fd3c3097ff41fa861649ea5b6c89d438100a759f24aa56aaea32feebf6a6
  5658ea44e78a3861b38b1359fbc2fcd6db49dd2ae580204333fea465745f6bffe241c9463fce0302ab85f17ccb26fa8db56dccb0cd45e88e7e7b14a9413deddb
  aa0b89b421f10bc7d2e3597f0b53a5bae33f4ffec66a86a07b186c681b10fb1e5fb3df4e87e11d4da27e24f1e1d87210798ab015832907e197533b719d1a0bb4
  cf63e1d8bee43c7df793222abbeb8809dc1cfa5eff7c996a97b1e0a9be2fdc4e3705603a9c9c1190a34260a28e9aa11834f55da03f5c6555f9b31b998e57889b
  f1a87f6bab0c8998ba42f3f11ea737a04c0a12e55b10364715ee3c794a60300cbe7c6c9de0ddf71783968f89c48c7cac5161da647e376fc41fab6ca7803832ac
)

prepare() {
  cd $pkgname-$pkgver

  # https://bugzilla.gnome.org/show_bug.cgi?id=634170
  patch -Np1 -i ../gwget-1.0.4-notify-0.7.patch

  # https://bugzilla.gnome.org/show_bug.cgi?id=665286
  patch -Np1 -i ../gwget-1.0.4-glib-2.32.patch

  # https://bugzilla.gnome.org/show_bug.cgi?id=671759
  patch -Np1 -i ../drop-libgnomeui.patch

  # Port to GTK 3
  patch -Np1 -i ../gtk3-port.patch

  # Fix handling window close event
  patch -Np1 -i ../hide-window.patch

  # Fix with recent wget versions
  patch -Np1 -i ../wget.patch

  # Set fallback destination path properly, don't try to start downloading existing URL
  patch -Np1 -i ../various-fixes.patch

  # Port to GSettings
  patch -Np1 -i ../gsettings-port.patch

  # Install icon into icons directory
  sed -i 's|$(datadir)/pixmaps|$(datadir)/icons/hicolor/48x48/apps|' pixmaps/Makefile.am

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make

  convert pixmaps/gwget-large.png +set date:create +set date:modify -background none -extent 200x200 pixmaps/gwget-large.png
  convert pixmaps/gwget-large.png +set date:create +set date:modify -resize 64x64 -alpha on pixmaps/gwget-64.png
  convert pixmaps/gwget-large.png +set date:create +set date:modify -resize 128x128 -alpha on pixmaps/gwget-128.png
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 pixmaps/gwget-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/gwget.png"
  install -Dm644 pixmaps/gwget-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/gwget.png"
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
