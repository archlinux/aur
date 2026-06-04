# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>

_pkgname=playit
pkgname=playit-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP (Binary version, does not setup background service)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause')
provides=('playit')
conflicts=('playit')

source=("LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/playit-cloud/playit-agent/releases/download/v${pkgver}/playit_x86_64.pkg.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/playit-cloud/playit-agent/releases/download/v${pkgver}/playit_aarch64.pkg.tar.zst")
source_i686=("${_pkgname}-${pkgver}-i686.pkg.tar.zst::https://github.com/playit-cloud/playit-agent/releases/download/v${pkgver}/playit_i686.pkg.tar.zst")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.pkg.tar.zst::https://github.com/playit-cloud/playit-agent/releases/download/v${pkgver}/playit_armv7h.pkg.tar.zst")

sha256sums=('SKIP')
sha256sums_x86_64=('ad8dff2dd89fb74c2045b9ace68399c6a62ba0481085d762b9eb389830307bf1')
sha256sums_aarch64=('7821a091555943e13fc0315442a7996dffd3c326bb48f48e9a07fd7077d2ca42')
sha256sums_i686=('15d916733c6ebf09fe41b7f9c0f00f5655323600e90bd678353e17a88c7e4700')
sha256sums_armv7h=('e56135b8fa5583595e685609beb57d73e5cd46b91deff99158c30555a4b1aca9')

package() {
    local pkgfile
    local extractdir="$srcdir/extracted"

    pkgfile="$(find "$srcdir" -maxdepth 1 -name "${_pkgname}-${pkgver}-${CARCH}.pkg.tar.zst" -print -quit)"

    rm -rf "$extractdir"
    mkdir -p "$extractdir"

    bsdtar -xf "$pkgfile" -C "$extractdir"

    # for playit-bin, only install binary files

    install -Dm755 "$extractdir/opt/playit/playit"  "$pkgdir/opt/playit/playit"
    install -Dm755 "$extractdir/opt/playit/playitd" "$pkgdir/opt/playit/playitd"
    install -Dm755 "$extractdir/opt/playit/agent" "$pkgdir/opt/playit/agent"

    mkdir -p "$pkgdir/usr/bin"

    ln -s /opt/playit/playit  "$pkgdir/usr/bin/playit"
    ln -s /opt/playit/playitd "$pkgdir/usr/bin/playitd"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

