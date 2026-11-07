# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
# Template: the Release workflow fills 2026.11.7.1 and d603ec7cdd2826fabb2b34cb10a2314b08371ce830ddc57d9cac88bbeca5e515 and pushes the result to
# https://aur.archlinux.org/packages/steamrip-desktop-bin. Repacks the released .deb, so there is one
# binary for every distro.
pkgname=steamrip-desktop-bin
_pkgname=steamrip-desktop
pkgver=2026.11.7.1
pkgrel=1
pkgdesc="Tray app that keeps a steamrip.com game library synced, installed, launched (Proton via umu) and updated"
arch=('x86_64')
url="https://github.com/JochemKuipers/steamrip-desktop"
license=('MIT')
depends=('libx11' 'libice' 'libsm' 'fontconfig' 'unrar' 'umu-launcher' 'libsecret')
optdepends=('7zip: fallback archive tool'
            'wine: fallback runner when umu-launcher is unavailable')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip') # the .NET single-file bundle must stay byte-for-byte intact
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('d603ec7cdd2826fabb2b34cb10a2314b08371ce830ddc57d9cac88bbeca5e515')

package() {
    bsdtar -xOf "$_pkgname-$pkgver.deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
    # the .deb carries the licence under Debian's name; Arch wants /usr/share/licenses/$pkgname/
    install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -r "$pkgdir/usr/share/doc"
}
