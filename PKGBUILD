#Maintainer: Ludwintor <ludwintor at proton dot me>

pkgname=tonkeeper-bin
pkgver=4.3.2
pkgrel=1
pkgdesc='Your desktop wallet on The Open Network (Static binaries from upstream)'
arch=('x86_64' 'aarch64')
url=https://tonkeeper.com
license=('Apache-2.0')
depends=(gtk3 libnotify nss libxtst xdg-utils at-spi2-core libdrm mesa libxcb glib2 alsa-lib)
optdepends=(
    'org.freedesktop.secrets: Store secrets'
)
provides=('tonkeeper')
conflicts=('tonkeeper')
options=(!debug)
_repo_url=https://github.com/tonkeeper/tonkeeper-web/releases/download
source_x86_64=(
    "tonkeeper_${pkgver}_x86_64.deb::${_repo_url}/v${pkgver}/tonkeeper_${pkgver}_amd64.deb"
)
source_aarch64=(
    "tonkeeper_${pkgver}_aarch64.deb::${_repo_url}/v${pkgver}/tonkeeper_${pkgver}_arm64.deb"
)
noextract=("tonkeeper_${pkgver}_${CARCH}.deb")
sha256sums_x86_64=('931e106cc40055d61e1f3dab3d877dbbd95236b3706a5e3f311589135cce8d36')
sha256sums_aarch64=('27483f0e24bff3dace51f44e89b9eb0e9c9f096b81f05047ec10c1e7b1b9ec7d')

prepare() {
    mkdir -p out
    bsdtar -O -xf tonkeeper_${pkgver}_${CARCH}.deb data.tar.xz | bsdtar -C out -xJf -
}

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    cp -r out/usr/lib/tonkeeper/. "${pkgdir}/opt/tonkeeper"
    ln -s /opt/tonkeeper/Tonkeeper "${pkgdir}/usr/bin/tonkeeper"

    install -Dm644 out/usr/share/applications/tonkeeper.desktop \
        "${pkgdir}/usr/share/applications/tonkeeper.desktop"
    install -Dm644 out/usr/share/pixmaps/tonkeeper.png \
        "${pkgdir}/usr/share/pixmaps/tonkeeper.png"
}
