# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-privacy-badger-bin'
pkgver=2025.3.3
pkgrel=1
pkgdesc='Automatically learns to block invisible trackers.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/'
license=('GPL-3.0')
depends=('firefox')
conflicts=('firefox-extension-privacybadger')
_source_file_id=4447530
source=('privacy_badger.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/privacy_badger17-${pkgver}.xpi")
noextract=('privacy_badger.xpi')
sha256sums=('7acf878b3cd4a3b5ca7c98cbe3e31630bc6a048156db03bf2021795cce68ba97')

prepare() {
  cd "$srcdir"

  unzip -qqo "privacy_badger.xpi" -d "privacy_badger-${pkgver}"
}

package() {
  cd "${srcdir}"

  if [[ -f privacy_badger-${pkgver}/install.rdf ]]; then
    _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' privacy_badger-${pkgver}/install.rdf)"
  else
    _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' privacy_badger-${pkgver}/manifest.json)"
  fi
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep -q '<em:unpack>true</em:unpack>' privacy_badger-${pkgver}/install.rdf 2>/dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R privacy_badger-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 privacy_badger.xpi "${_extension_dest}.xpi"
  fi
}
