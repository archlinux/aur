# Maintainer: Clemens Brunner <clemens.brunner@gmail.com>

pkgname=kymo-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Viewer for large EEG and MEG recordings (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/cbrnr/kymo"
license=('BSD-3-Clause')
# Loaded at run time rather than linked: Vulkan for wgpu, the window system for winit, the
# desktop portal for file dialogs.
depends=('libgcc' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'vulkan-icd-loader'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'xdg-desktop-portal')
optdepends=('vulkan-driver: GPU rendering (mesa or the vendor driver provide one)')
provides=('kymo')
conflicts=('kymo')
# The release binary is stripped already.
options=('!strip' '!debug')
# ${pkgver} with braces: the updater then bumps pkgver= and leaves the URLs as they are.
source_x86_64=("https://github.com/cbrnr/kymo/releases/download/v${pkgver}/kymo-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/cbrnr/kymo/releases/download/v${pkgver}/kymo-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('2e318fabc5f055e2eb89df6e1e4c5013af31209caedb99cf1f4e8223b983bfff')
sha256sums_aarch64=('d180ac326b34473fd1f93889bbb13d3f3d523080513968e9b58d15bf4c8a736e')

package() {
    # The release names arm64 what Arch names aarch64.
    local _arch=$CARCH
    [[ $CARCH == aarch64 ]] && _arch=arm64
    cd "kymo-$pkgver-linux-$_arch"
    install -Dm755 kymo "$pkgdir/usr/bin/kymo"
    cp -r --no-preserve=ownership share "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
