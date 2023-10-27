# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=kiwitalk-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="An UNOFFICIAL cross-platform KakaoTalk client written in TypeScript & Rust"
arch=('x86_64')
url="https://github.com/KiwiTalk/KiwiTalk"
license=('Apache')
conflicts=('kiwitalk')
provides=('kiwitalk')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk' 'libappindicator-gtk3')

_prgname="kiwi-talk"
_debfile="${_prgname}_${pkgver}_amd64.deb"
source=("https://github.com/KiwiTalk/KiwiTalk/releases/download/v${pkgver}/${_debfile}")
sha256sums=('94b663585e3faf0dcf571528d3dbaac3c56176524d3ede35393a43a82eb97ae0')

#sudo apt-get install -y libgtk-3-dev libwebkit2gtk-4.0-dev libappindicator3-dev librsvg2-dev patchelf
prepare() {
  ar x ${_debfile}
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz
}

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 usr/bin/${_prgname} -t "$pkgdir/usr/bin/"

  # Install desktop file from deb
  install -Dm644 "usr/share/applications/${_prgname}.desktop" -t \
    "$pkgdir/usr/share/applications/"

  # Install desktop icons from deb
  for icon_size in 32 128 256 512; do
    icons_dir="usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -Dm644 "${icons_dir}/${_prgname}.png" -t "$pkgdir/${icons_dir}/"
  done
}
