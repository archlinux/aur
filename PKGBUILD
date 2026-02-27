pkgbase=credentialsd
pkgname=(credentialsd firefox-extension-credentialsd)
pkgver=0.2.0
pkgrel=1
pkgdesc="Proposal for a Linux credential management xdg portal D-Bus specification, including webauthn/passkey support"
arch=(x86_64)
url=https://github.com/linux-credentials/credentialsd
license=(LGPL-3.0-or-later)
depends=(gtk4 dbus systemd-libs libnfc pcsclite)
makedepends=(rust meson zip desktop-file-utils jq blueprint-compiler clang)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-credentials/credentialsd/archive/refs/tags/v$pkgver.tar.gz"
        "0001-do-not-build-in-installing.diff")
sha256sums=('83f0a930f5f0ef617288060137c50c5605c74483237dd03a309967dcd47de605'
            'e482662ce56195b3d7a35bac76a897010489cd47e0bfc937c1135217269e70a0')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    cd "$pkgname-$pkgver"
    patch -Np1 -i ../0001-do-not-build-in-installing.diff
    cargo fetch --locked --target host-tuple
}
build() {
    export RUSTUP_TOOLCHAIN=stable
    arch-meson "$pkgbase-$pkgver" build \
        -Dcargo_home="$srcdir/cargo-home" \
        -Dcargo_locked=true \
        -Dcargo_offline=true
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
