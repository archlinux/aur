# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=kiwitalk-bin
pkgver=0.4.0
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
sha256sums=('cc3f4736b7d5afad3e6e962f21556b53e6a933a5365e3ee80bb7eea59a121c0e')

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
