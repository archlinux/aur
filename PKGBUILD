# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=chromium-widevine-helper
pkgver=1.0.8
pkgrel=1
pkgdesc="Extension + native helper that installs Google's Widevine CDM into Chromium-based browser profiles"
arch=('any')
url="https://github.com/GloriousEggroll/chromium-widevine-helper"
license=('GPL-3.0-only')
depends=('python' 'procps-ng' 'ca-certificates')
backup=('etc/helium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/net.imput.helium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/chromium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/chromium-browser/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opt/chrome/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opt/edge/native-messaging-hosts/org.chromium.widevine.json'
        'etc/brave/native-messaging-hosts/org.chromium.widevine.json'
        'etc/vivaldi/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opera/native-messaging-hosts/org.chromium.widevine.json'
        'etc/thorium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/iridium/native-messaging-hosts/org.chromium.widevine.json')
# Upstream publishes neither releases nor tags; the canonical version lives in
# %global helper_version in Packaging/rpm/chromium-widevine-helper.spec. The
# package is pinned to the commit that carries the packaged version, so it is
# tied to a specific version and needs no -git suffix.
_commit="2851c31896aa7cd43895e4c4d9b749ca08188aec"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('d1ded7b511351a39c6a38c0f2a5666c6b27dc05236808a4c4acebebf9a9d4364')

prepare() {
  local _specver
  _specver="$(grep -Po '^%global helper_version \K[0-9.]+' \
    "${pkgname}-${_commit}/Packaging/rpm/chromium-widevine-helper.spec")"
  [[ "$_specver" == "$pkgver" ]] || {
    echo "pinned commit declares $_specver, expected $pkgver" >&2
    return 1
  }
}

package() {
  cd "${pkgname}-${_commit}"

  # Fedora's /usr/libexec, which Arch does not use
  install -Dm755 helper/chromium-widevine \
    "$pkgdir/usr/lib/chromium-widevine/chromium-widevine"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/chromium-widevine/chromium-widevine \
    "$pkgdir/usr/bin/chromium-widevine"

  # The extension is shipped so it can be loaded unpacked from
  # chrome://extensions (chromium-widevine --install-native-hosts then
  # registers whatever ID the browser assigned it).
  install -d "$pkgdir/usr/share/chromium-widevine"
  cp -a extension "$pkgdir/usr/share/chromium-widevine/extension"
  find "$pkgdir/usr/share/chromium-widevine" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/chromium-widevine" -type f -exec chmod 644 {} +

  # upstream ships no license file; GPL-3.0-only is a common license
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # System-wide native messaging host manifests for the same browser lookup
  # roots upstream's RPM covers.
  local _hostdir
  for _hostdir in helium net.imput.helium chromium chromium-browser \
                  opt/chrome opt/edge brave vivaldi opera thorium iridium; do
    install -Dm644 helper/chromium-widevine-native-host.json \
      "$pkgdir/etc/$_hostdir/native-messaging-hosts/org.chromium.widevine.json"
  done
  find "$pkgdir/etc" -name 'org.chromium.widevine.json' -exec \
    sed -i 's|/usr/libexec/chromium-widevine/|/usr/lib/chromium-widevine/|' {} +
}
