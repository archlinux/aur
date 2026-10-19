# Maintainer: Felitendo
# Contributor: Pittore Studio
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=pittore-studio-bin
pkgver=0.1.6
pkgrel=1
# Upstream's own package release in the asset name, synced by pkg.sh. It only
# moves when upstream repackages a version that has already shipped.
_relver=1
pkgdesc="Layer-based photo editor for Linux (upstream binary)"
arch=('x86_64')
url="https://github.com/Event-Horizon-desktop-environment/pittore-studio"
license=('MIT')
# The same list as the source package, checked by pkg.sh against upstream's
# PKGBUILD. nvcc links the CUDA runtime statically, so an NVIDIA card needs
# nothing here but its driver.
depends=('fontconfig' 'freetype2' 'harfbuzz' 'lcms2' 'libjpeg-turbo' 'libtiff'
         'libwebp' 'qrencode' 'qt6-base' 'qt6-svg' 'tomlplusplus' 'zlib' 'zstd')
# the HIP backend is a plugin, dlopened once the runtime is installed
optdepends=('hip-runtime-amd: AMD GPU compute backend (ROCm HIP runtime)')
provides=("pittore-studio=${pkgver}")
conflicts=('pittore-studio')
# upstream's CI builds this with makepkg and publishes the debug symbols as
# their own release asset, so the binaries arrive stripped
options=('!strip' '!debug')
# The release asset is a pacman package built by upstream's CI from
# packaging/arch/PKGBUILD. makepkg extracts it, only its usr/ is taken.
# Upstream installs no license text, so it comes from the matching tag.
source=("${url}/releases/download/v${pkgver}/pittore-studio-${pkgver}-${_relver}-x86_64.pkg.tar.zst"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Event-Horizon-desktop-environment/pittore-studio/v${pkgver}/LICENSE")
sha256sums=('f6bf0bc14cd2397a107c98aaf33b231cfc599613823d21d6d5680f69e976ef7f' 'd98d3bc734ad2eaf3c334150c4adc04e272c46122a57678c5b8a05c0bc6b0594')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
