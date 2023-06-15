# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=tagger
_app_id=org.nickvision.tagger
pkgver=2022.11.2
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/NickvisionApps/Tagger"
license=('GPL3')
depends=('chromaprint' 'jsoncpp' 'libadwaita' 'libcurlpp' 'taglib')
makedepends=('meson')
checkdepends=('appstream-glib')
conflicts=('nickvision-tagger')
replaces=('nickvision-tagger')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fc6857bc3146c22dc04c9b05b7bdcf43fffabbf52d5649c634eaf159da0c456e')

build() {
  arch-meson "Tagger-$pkgver" build
  meson compile -C build
}

check() {
  cd "Tagger-$pkgver"
  appstream-util validate-relax --nonet "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"

  # conflicts with system chromaprint
  rm "$pkgdir/usr/bin/fpcalc"

  # File (usr/bin/org.nickvision.tagger) has the world writable bit set.
  chmod 0755 "$pkgdir/usr/bin/${_app_id}"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
