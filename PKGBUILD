pkgbase=credentialsd
pkgname=(credentialsd firefox-extension-credentialsd)
pkgver=0.1.0
pkgrel=1
pkgdesc="Proposal for a Linux credential management xdg portal D-Bus specification, including webauthn/passkey support"
arch=(x86_64)
url=https://github.com/linux-credentials/credentialsd
license=(LGPL-3.0-or-later)
depends=(gtk4 dbus systemd-libs)
makedepends=(rust meson zip desktop-file-utils jq)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-credentials/credentialsd/archive/refs/tags/v$pkgver.tar.gz"
        "0001-fix-get_event_loop-failure.diff")
sha256sums=('2bc73f5dd91d73eed3446f0ede9256eaf192c76eee21066af4330db22c2c6d8a'
            'a4242f4afd655e7a9d1dfd40c2cfe38c279e39111441c213fcb1996721423ff3')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-fix-get_event_loop-failure.diff
}
build() {
    export RUSTUP_TOOLCHAIN=stable
    arch-meson "$pkgbase-$pkgver" build
    meson compile -C build
}
package_credentialsd() {
    meson install -C build --destdir "$pkgdir"
}
package_firefox-extension-credentialsd() {
    arch=(any)
    pkgdesc="Firefox helper extension for credentialsd"
    depends=('firefox>=140.0' python-dbus-next credentialsd)

    local id
    id="$(jq -r .browser_specific_settings.gecko.id "$pkgbase-$pkgver/webext/add-on/manifest.json")"
    mkdir -p "$pkgdir/usr/lib/firefox/browser/extensions"
    ln -srfv "$pkgdir/usr/share/credentialsd/credentialsd-firefox-helper.xpi" \
             "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
