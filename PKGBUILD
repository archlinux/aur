# Maintainer: czyt <czytcn@gmail.com>
pkgname=anser-client-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Native desktop client for Anser (雁字): the inbox, the sender and the delivery log of a self-hosted notification service"
arch=('x86_64')
url="https://github.com/ca-x/anser"
license=('Apache-2.0')
# The program is written for GTK 4 and the web view of WebKitGTK 6.0.
depends=('cairo' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'graphene'
         'gst-plugins-base-libs' 'gstreamer' 'gtk4' 'harfbuzz' 'libsoup3'
         'pango' 'webkitgtk-6.0')
options=('!strip' '!debug')

# The release carries the client for Linux and a list of checksums. The file
# name in the release has no version in it, so the local copy gets one: a new
# release must not be served from the cache of the last one.
_tarball="anser-client-${pkgver}-linux-x86_64.tar.gz"

source=("LICENSE-${pkgver}::https://github.com/ca-x/anser/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_tarball}::https://github.com/ca-x/anser/releases/download/v${pkgver}/anser-client-linux-x86_64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('71146bdbd6e59b077afef0fd7dfe7f2e944c19db705af60c972236719d20d456')

package() {
    # The program looks for its data next to itself, so the whole directory of
    # the release is installed unchanged. The name of that directory is the
    # name of the app, which follows the language of the release.
    local appdir
    appdir=$(find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -print -quit)
    install -d "${pkgdir}/usr/lib/anser-client"
    cp -a "${appdir}/." "${pkgdir}/usr/lib/anser-client/"

    # The desktop entry of the release starts a program called "App" that sits
    # next to it; the package gives the client a command of its own.
    install -Dm644 "${pkgdir}/usr/lib/anser-client/io.github.cax.anser.desktop" \
        "${pkgdir}/usr/share/applications/io.github.cax.anser.desktop"
    sed -i 's|^Exec=.*|Exec=anser-client %u|' \
        "${pkgdir}/usr/share/applications/io.github.cax.anser.desktop"

    # The icon of the release is 1254 pixels wide.
    install -Dm644 "${pkgdir}/usr/lib/anser-client/io.github.cax.anser.png" \
        "${pkgdir}/usr/share/icons/hicolor/1254x1254/apps/io.github.cax.anser.png"

    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/anser-client/App "${pkgdir}/usr/bin/anser-client"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
