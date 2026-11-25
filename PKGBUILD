# Maintainer: Philip Hauser
# SPDX-License-Identifier: 0BSD
pkgname=apex-gp-bin
pkgver=0.12.5
pkgrel=1
pkgdesc='Open-wheel racing game with steering wheel force feedback'
arch=('x86_64')
url='https://apexgp.racing'
license=('LicenseRef-Apex-GP')
depends=(
  'glibc>=2.43'
  'vulkan-icd-loader' 'vulkan-driver'
  'wayland' 'libxkbcommon' 'libdecor'
  'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr' 'libxrender'
  'libglvnd' 'alsa-lib' 'libpulse'
  'dbus' 'fontconfig' 'systemd-libs' 'hicolor-icon-theme'
)
makedepends=('imagemagick')
provides=("apex-gp=$pkgver")
conflicts=('apex-gp')
options=('!strip' '!debug')
_dist="ApexGP-${pkgver}-linux-x86_64"
source=("$url/dl/$_dist.tar.gz" 'apex-gp.desktop')
sha256sums=('4998cd89c31113ef63a2cac29cdfd50cee6427b7bff2e5e5c3bb59b2d556716f'
            'd2f109fd04d30e24f10afd1691da0e7b6bac174d83de70bedb5cb77c15b66891')

build() {
  local size
  for size in 48 128 256; do
    magick "$_dist/apex-gp.png" -resize "${size}x${size}" -strip "apex-gp-${size}.png"
  done
}

package() {
  local size
  install -Dm755 "$_dist/ApexGP.x86_64" "$pkgdir/opt/apex-gp/ApexGP.x86_64"
  install -Dm644 "$_dist/ApexGP.pck" "$pkgdir/opt/apex-gp/ApexGP.pck"
  install -d "$pkgdir/usr/bin"
  ln -s ../../opt/apex-gp/ApexGP.x86_64 "$pkgdir/usr/bin/apex-gp"

  install -Dm644 apex-gp.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_dist/apex-gp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/apex-gp.png"
  for size in 48 128 256; do
    install -Dm644 "apex-gp-${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/apex-gp.png"
  done

  install -Dm644 "$_dist/README.txt" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$_dist/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$_dist"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
}
