# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=open-in-firefox
pkgver=1.0.8
pkgrel=1
pkgdesc="Native messaging host for the 'Open in Firefox' Chrome extension (andy-portmen/native-client)"
arch=('any')
url="https://github.com/andy-portmen/native-client"
license=('MPL-2.0')
depends=('nodejs')
optdepends=(
    'google-chrome: Google Chrome (AUR) — extension auto-install'
    'chromium: Chromium browser — extension auto-install'
)
install=open-in-firefox.install
source=("native-client-${pkgver}.tar.gz::https://github.com/andy-portmen/native-client/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e13c679fb088fdad57edb94e91842a0feb782549df2ed92a64b3ea0cedeee278')

package() {
    cd "$srcdir/native-client-$pkgver"

    local _sharedir="$pkgdir/usr/share/native-client"
    local _host_path="/usr/share/native-client/run.sh"
    local _ext_id="lmeddoobegbaiopohmpmmobpnpjifpii"

    # --- host files ---
    install -Dm644 host.js      "$_sharedir/host.js"
    install -Dm644 messaging.js "$_sharedir/messaging.js"
    install -Dm644 config.js    "$_sharedir/config.js"

    # Wrapper script invoked by the browser as the native messaging host
    mkdir -p "$_sharedir"
    printf '#!/usr/bin/env bash\nexec node "$(dirname "$(readlink -f "$0")")/host.js" "$@"\n' \
        > "$_sharedir/run.sh"
    chmod 755 "$_sharedir/run.sh"

    # --- native messaging manifests (system-wide) ---
    # Generate the manifest JSON using the extension IDs bundled in config.js
    local _manifest
    _manifest=$(node -e "
const c = require('./config.js');
const origins = c.ids.chrome.map(id => 'chrome-extension://' + id + '/');
const manifest = {
    name: 'com.add0n.node',
    description: 'Node Host for Native Messaging',
    path: '$_host_path',
    type: 'stdio',
    allowed_origins: origins
};
process.stdout.write(JSON.stringify(manifest, null, 4));
")

    local _nmh_dirs=(
        "$pkgdir/etc/opt/chrome/native-messaging-hosts"        # Google Chrome
        "$pkgdir/etc/chromium/native-messaging-hosts"           # Chromium
        "$pkgdir/etc/brave/native-messaging-hosts"              # Brave
        "$pkgdir/etc/opt/edge/native-messaging-hosts"           # Microsoft Edge
    )
    for _dir in "${_nmh_dirs[@]}"; do
        mkdir -p "$_dir"
        echo "$_manifest" > "$_dir/com.add0n.node.json"
    done

    # --- extension auto-install (drops a JSON stub that tells the browser to
    #     fetch the extension from the Chrome Web Store on next launch) ---
    local _ext_json='{"external_update_url": "https://clients2.google.com/service/update2/crx"}'
    local _ext_dirs=(
        "$pkgdir/opt/google/chrome/extensions"                  # Google Chrome
        "$pkgdir/usr/share/chromium/extensions"                 # Chromium (Arch)
    )
    for _dir in "${_ext_dirs[@]}"; do
        mkdir -p "$_dir"
        echo "$_ext_json" > "$_dir/$_ext_id.json"
    done

    # --- license ---
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
