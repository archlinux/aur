# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.22.7
pkgrel=2
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "arm64")
license=('GPL-3.0-only')
url="https://github.com/2dust/v2rayN"
depends=('fontconfig')
# .NET AOT binaries break if stripped.
options=('!strip')

source_x86_64=("v2rayN-linux-64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=('ab4557458d8794dda5470f4995a472a91f0b6e04303e0e06e8619a16c6546103')
source_arm64=("v2rayN-linux-arm64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_arm64=('16189e45297016e0d5b03d7882d0efc14260a1ed9ecb7a3db6ada30c0fcd17d4')

source=("v2rayN.png" "v2rayN-bin.desktop")
sha256sums=('f762fd95d93c2287f55ebb742716a54aa6b507ff8c8d75aec7256fabc93192ee'
            '307cbfaf4aabf2a36f72d66963f04604f71bc068361e5d0eb8feaff8feeaf21a')

package() {
  local _dest="$pkgdir/opt/$pkgname"

  install -Dm644 "$srcdir/v2rayN.png"        -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "$srcdir/v2rayN-bin.desktop" -t "$pkgdir/usr/share/applications"

  install -dm755 "$_dest"
  cp -a "$srcdir"/v2rayN-linux-*/. "$_dest/"

  # Normalize to least privilege, then mark ELF files executable (by magic
  # bytes — locale- and fakeroot-safe, and adapts to any new bundled binary).
  find "$_dest" -type d -exec chmod 0755 {} +
  find "$_dest" -type f -exec chmod 0644 {} +
  while IFS= read -r -d '' f; do
    [ "$(od -An -N4 -tx1 "$f" | tr -d ' \n')" = 7f454c46 ] && chmod 0755 "$f"
  done < <(find "$_dest" -type f -print0)
}
