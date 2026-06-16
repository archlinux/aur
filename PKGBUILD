# Maintainer: brookerslyn <brookerslyn at REPLACE-WITH-YOUR-EMAIL-DOMAIN dot com>
pkgname=klyppd-bin
_pkgname=klyppd
pkgver=0.3.2
pkgrel=1
pkgdesc="Performance-first Linux clipping app with instant replay, trimming, and cloud uploads."
arch=('x86_64')
url="https://github.com/brookerslyn/klyppd"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
    'gpu-screen-recorder'
    'ffmpeg'
    'webkit2gtk-4.1'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
)
optdepends=(
    'libnotify: desktop notifications for clip events'
)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_pkgname}-${pkgver}.deb")
sha256sums=('2ac2b402fb35dbbe2d18b8dcf6840cc3504cdea7b67953a771ca637824625667')

package() {
    cd "$srcdir"

    # A .deb is an ar archive containing data.tar.gz with the filesystem payload.
    bsdtar -xf "${_pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "$pkgdir"

    # Tauri's deb installs the binary at /usr/bin/<name>; nothing to fix in most cases.
    # If Tauri changes its layout, normalize here.
    if [ ! -f "$pkgdir/usr/bin/$_pkgname" ] && [ -f "$pkgdir/usr/lib/$_pkgname/$_pkgname" ]; then
        install -dm755 "$pkgdir/usr/bin"
        mv "$pkgdir/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    fi
}
