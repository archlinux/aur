# Maintainer: J. Nathanael Philipp <jnathanael@philipp.land>
pkgname=gnome-shell-extension-quick-lofi
pkgver=1.7.0
pkgrel=1
pkgdesc='Play lofi music and other sounds, locally or online, on your GNOME desktop with just a click!'
arch=('any')
url="https://github.com/EuCaue/gnome-shell-extension-quick-lofi"
license=('GPL-3.0-only')
depends=('gnome-shell' 'mpv')
makedepends=('jq')
source=(
    "https://github.com/EuCaue/gnome-shell-extension-quick-lofi/releases/download/v${pkgver}/quick-lofi@eucaue.zip"
    "https://raw.githubusercontent.com/EuCaue/gnome-shell-extension-quick-lofi/refs/heads/master/LICENSE"
)
sha256sums=(
    "8f544d6ff53989811bae5c8e75cc29343853cd9b1e513f8ae20119f017eb08ee"
    "d9b35296af104bd3ee62939b8d80ab8db7fe0aa61b30d2fe14acb2704904d299"
)

prepare() {
    patch -d $srcdir -Np1 -i ../gnome50.patch
}

package() {
    _uuid=$(jq -r .uuid "${srcdir}/metadata.json")
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    bsdtar xf "${srcdir}/quick-lofi@eucaue.zip" -C "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
    install -m644 "${srcdir}/metadata.json" "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/schemas/org.gnome.shell.extensions.quick-lofi.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
