# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-nightly-bin
pkgver=0.37.4.nightly.2901
pkgrel=1
# Nightlies follow the release they are numbered after, so 0.37.0.nightly.2527
# sorts between 0.37.0 and 0.37.1. Earlier versions of this package used epoch 1.
epoch=1
if [[ "$pkgver" == *.nightly.* ]]; then
    _tag="v${pkgver/.nightly./-nightly-}"
    _asset_version=${_tag#v}
else
    _tag="v${pkgver}-beta"
    _asset_version="${pkgver}_beta"
fi
pkgdesc='A private desktop YouTube client, nightly channel'
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL-3.0-or-later')
options=('!strip')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss'
         'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_arm64.deb")

package() {
    bsdtar -xf data.tar.* -C "$pkgdir"
    # The deb can carry group- and world-writable modes; never install those.
    chmod -R u=rwX,go=rX "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('60f2cb54a943e338df61914808e4019b0808a93c1b95003e5223e4823e84058f')
sha256sums_aarch64=('d1d291e30b0805962dd110688f290e1e3c5a9f142cbb90f81081c0192277a574')
