# Maintainer: Adam <adam@atlas-sw.com>
pkgname=kraken-workbench-bin
_name=kraken
pkgver=0.1.0
pkgrel=1
pkgdesc="Reverse-engineering workbench on Ghidra's decompiler: analyse, patch and rewrite binaries, with an AI assistant"
arch=('x86_64')
url="https://github.com/Adam-AtlasSoftware/kraken"
license=('GPL-3.0-or-later AND Apache-2.0 AND Zlib')
# The app loads libglvnd/libxkbcommon (and Wayland or X11) at run time. The Ghidra extension jar
# runs inside the Ghidra and JDK that `kraken setup` downloads, so no java-runtime is needed.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libstdc++' 'libxkbcommon')
optdepends=('wayland: run the app in a Wayland session'
            'libx11: run the app in an X11 session'
            'libxcursor: run the app in an X11 session'
            'libxi: run the app in an X11 session'
            'libxrandr: run the app in an X11 session'
            'vulkan-icd-loader: draw the app with Vulkan')
provides=('kraken-workbench')
conflicts=('kraken-workbench')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('94ba14e370e56ae8ed113801cb1c8b2cee3602400ddbe051c3d45476f1e67950')

package() {
  cd "${_name}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 -t "${pkgdir}/usr/bin" bin/*
  # The programs find their data in ../share/kraken beside /usr/bin.
  install -d "${pkgdir}/usr/share/kraken"
  cp -R --no-preserve=ownership share/kraken/. "${pkgdir}/usr/share/kraken/"
  install -Dm644 share/applications/kraken-gui.desktop \
    "${pkgdir}/usr/share/applications/kraken-gui.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/kraken-gui.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kraken-gui.svg"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R --no-preserve=ownership docs/. "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE THIRD-PARTY-NOTICES.md
  cp -R --no-preserve=ownership licenses/. "${pkgdir}/usr/share/licenses/${pkgname}/"
}
