# Maintainer: K4zoku <k4zoku@pm.me>
#
# This PKGBUILD downloads the WebHID Firefox extension from AMO (addons.mozilla.org).
# Always fetches the latest release; pkgver is extracted from the XPI manifest,
# so the version tracks the downloaded artifact automatically.

pkgname=webhid-addon
pkgver=3.1.0
pkgrel=1
pkgdesc='WebHID browser extension for Firefox and Zen (system-wide installation)'
arch=('any')
url='https://github.com/K4zoku/FF-WebHID'
license=('MIT')
depends=('webhid')
makedepends=('unzip' 'jq')
install=webhid-addon.install
_ext_id='webhid@k4zoku.dev'
_amo_url="https://addons.mozilla.org/firefox/downloads/latest/${_ext_id}/latest.xpi"
source=("${_ext_id}.xpi::${_amo_url}")
sha256sums=('SKIP')
noextract=("${_ext_id}.xpi")

_ff_guid='{ec8030f7-c20a-464f-9b0e-13a3a9e97384}'

pkgver() {
    local _ver
    _ver=$(unzip -p "$srcdir/${_ext_id}.xpi" manifest.json | jq -r '.version')
    [[ -n "$_ver" ]] || return 1
    printf '%s' "$_ver"
}

build() {
    msg2 "Building webhid-addon version $pkgver"
}

_browser_forks=(librewolf waterfox)

_install_browser_forks() {
    local _src="$1" _dest="$2" _root
    for _root in "${_browser_forks[@]}"; do
        install -Dm644 "$_src" "$pkgdir/usr/lib/$_root/$_dest"
    done
}

package() {
    local _xpi="$srcdir/${_ext_id}.xpi"

    install -Dm644 "$_xpi" \
        "$pkgdir/usr/lib/mozilla/extensions/$_ff_guid/$_ext_id.xpi"
    _install_browser_forks "$_xpi" "extensions/$_ext_id.xpi"
}
