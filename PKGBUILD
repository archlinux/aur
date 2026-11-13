# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/recompia-bin

pkgname=recompia-bin
pkgver=0.12.0 # renovate: datasource=github-releases depName=Dittobyte/Recompia versioning=semver-coerced
pkgrel=1
pkgdesc="Pokopia recompilation launcher with multiplayer support (requires game files)"
arch=('x86_64')
url="https://github.com/Dittobyte/Recompia"
license=('GPL-3.0-only' 'MIT' 'BSD-3-Clause' 'Apache-2.0' 'CC0-1.0' 'custom')
depends=('bash' 'coreutils' 'glibc' 'gcc-libs' 'fuse2' 'gtk3' 'webkit2gtk-4.1' 'vulkan-icd-loader' 'xdg-utils')
optdepends=('steam: install Proton Experimental to build shaders and run the game'
            'umu-launcher: alternative Proton runner without Steam'
            'wine: alternative Windows runtime')
provides=('recompia')
conflicts=('recompia')
options=('!strip' '!debug')
source=("PokopiaRecomp-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/PokopiaRecomp-${pkgver}-linux-x64.tar.gz"
        'recompia'
        'recompia.desktop')
sha256sums=('f53ae15600b0891fc48f3a178626eadcd1dbd3fb5e3a4ee76034ae28b416cb35'
            'daf607e9694adffb76a967c6863c4bc959a7bb274a59e9fbbeca2a1bb44f5806'
            '9e5e3c9c8cb09a8e65b35031c3c1ab91cee072871fe1e22fa8611defeec1dbb0')

prepare() {
  chmod +x "PokopiaRecomp-${pkgver}/PokopiaLauncher.AppImage"
  "${srcdir}/PokopiaRecomp-${pkgver}/PokopiaLauncher.AppImage" --appimage-extract >/dev/null
}

package() {
  install -dm755 "${pkgdir}/opt/recompia"
  cp -r "${srcdir}/PokopiaRecomp-${pkgver}/." "${pkgdir}/opt/recompia/"
  printf '%s\n' "${pkgver}-${pkgrel}" > "${pkgdir}/opt/recompia/.package-version"
  install -Dm755 "${srcdir}/recompia" "${pkgdir}/usr/bin/recompia"
  install -Dm644 "${srcdir}/recompia.desktop" "${pkgdir}/usr/share/applications/recompia.desktop"
  install -Dm644 "${srcdir}/squashfs-root/PokopiaLauncher.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/recompia.png"
  install -Dm644 "${srcdir}/PokopiaRecomp-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/PokopiaRecomp-${pkgver}/licenses/." "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/PokopiaRecomp-${pkgver}/assets/prompts/LICENSE-Kenney-InputPrompts.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Kenney-InputPrompts.txt"
}
