# Maintainer: maxlen <maxlen@duck.com>
#
# Repackages the upstream Linux (DEB) release; building from source needs the
# full Flutter + Rust + LLVM toolchain. Named breeze-comic-bin because the
# official extra repo already ships "breeze" (the KDE Plasma theme).

pkgname=breeze-comic-bin
pkgver=3.0.31
pkgrel=1
pkgdesc="Comic/manga reader with plugin support for Bika, JM, Ehentai and more"
arch=('x86_64')
url="https://github.com/deretame/Breeze"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
  'at-spi2-core' 'cairo' 'curl' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2'
  'glib2' 'gtk3' 'harfbuzz' 'libayatana-appindicator' 'ayatana-ido'
  'libayatana-indicator' 'libdbusmenu-glib' 'libepoxy' 'libsoup3' 'pango'
  'webkit2gtk-4.1' 'zlib'
)
options=('!strip' '!debug')
_url="https://github.com/deretame/Breeze/releases/download/v${pkgver}"
source=(
  "${_url}/breeze_${pkgver}_amd64-v${pkgver}.deb"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/deretame/Breeze/v${pkgver}/LICENSE"
)
noextract=("breeze_${pkgver}_amd64-v${pkgver}.deb")
sha256sums=('4b6653871f8e980a7f273ea88f87b18120857e6b7974e918baeb89e1208ab168'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')

package() {
  cd "$srcdir"

  bsdtar -xf "breeze_${pkgver}_amd64-v${pkgver}.deb"
  bsdtar -xf data.tar.zst

  # Bundle is relocatable (RPATH is $ORIGIN/lib), so it can live under a
  # breeze-comic path instead of upstream's /opt/breeze.
  install -dm755 "$pkgdir/usr/lib"
  cp -a opt/breeze "$pkgdir/usr/lib/breeze-comic"

  install -dm755 "$pkgdir/usr/bin"
  ln -s ../lib/breeze-comic/breeze "$pkgdir/usr/bin/breeze-comic"

  sed -i 's/^Exec=breeze$/Exec=breeze-comic/' \
    "usr/share/applications/io.github.windy.breeze.desktop"
  install -Dm644 "usr/share/applications/io.github.windy.breeze.desktop" \
    "$pkgdir/usr/share/applications/io.github.windy.breeze.desktop"
  install -Dm644 "usr/share/icons/hicolor/512x512/apps/io.github.windy.breeze.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.windy.breeze.png"

  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
