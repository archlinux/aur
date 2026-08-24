# Maintainer: K4zoku <k4zoku@pm.me>
#
# This PKGBUILD builds the WebHID Firefox extension from the latest git
# commit. The resulting XPI is UNSIGNED (version derived via git describe).
#
# Signing caveat: unsigned extensions load system-wide on LibreWolf and
# Waterfox (signature enforcement disabled at build level), and on Firefox
# ESR/Nightly/Developer Edition with xpinstall.signatures.required=false.
# Stock Firefox Release rejects unsigned add-ons regardless of install scope.

_pkgbase=webhid-addon
pkgname=${_pkgbase}-git
pkgver=3.1.0.r96.g050c5e5
pkgrel=1
pkgdesc='WebHID browser extension for Firefox and Zen (git build, unsigned)'
arch=('any')
url='https://github.com/K4zoku/FF-WebHID'
license=('MIT')
depends=('webhid')
makedepends=('git' 'nodejs' 'npm')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=webhid-addon-git.install
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

_ff_guid='{ec8030f7-c20a-464f-9b0e-13a3a9e97384}'
_ext_id='webhid@k4zoku.dev'

pkgver() {
    cd "${_pkgbase}"
    git describe --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgbase}"
    npm ci
}

build() {
    cd "${_pkgbase}"
    npm run build:addon
}

_browser_forks=(librewolf waterfox)

_install_browser_forks() {
    local _src="$1" _dest="$2" _root
    for _root in "${_browser_forks[@]}"; do
        install -Dm644 "$_src" "$pkgdir/usr/lib/$_root/$_dest"
    done
}

package() {
    local _root="$srcdir/${_pkgbase}"
    local _xpi="$_root/dist/webhid-addon.xpi"

    if [[ ! -f "$_xpi" ]]; then
        error "Expected XPI not found: $_xpi"
        return 1
    fi

    install -Dm644 "$_xpi" \
        "$pkgdir/usr/lib/mozilla/extensions/$_ff_guid/$_ext_id.xpi"
    _install_browser_forks "$_xpi" "extensions/$_ext_id.xpi"
}
