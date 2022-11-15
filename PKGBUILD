# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=nickvision-tagger
_app_id=org.nickvision.tagger
pkgver=2022.11.1
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/nlogozzo/NickvisionTagger"
license=('GPL3')
depends=('chromaprint' 'jsoncpp' 'libadwaita' 'libcurlpp' 'taglib')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3d7344729b55e9068585dbefae852b0325134df671be260d0d3bd20f2a582671')

build() {
  arch-meson NickvisionTagger-$pkgver build
  meson compile -C build
}

check() {
  cd NickvisionTagger-$pkgver
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
