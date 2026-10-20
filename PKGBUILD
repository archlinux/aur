# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=appattic-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="Leftovers, stale apps, unused packages, and disk usage (AppImage)"
arch=('x86_64')
url="https://github.com/maci0/appattic"
license=('LicenseRef-proprietary' 'Apache-2.0' 'OFL-1.1')
depends=('fuse2' 'hicolor-icon-theme')
provides=('appattic-qt')
conflicts=('appattic-qt')
options=('!strip')
source=(
  "https://github.com/maci0/appattic/releases/download/v${pkgver}/AppAttic-x86_64.AppImage"
  "wasmtime-LICENSE::https://raw.githubusercontent.com/bytecodealliance/wasmtime/v28.0.0/LICENSE"
)
sha256sums=(
  '38550f642100a86cc31a86470a838e067fa13d8413e98081024e3ceae30ffddf'
  '268872b9816f90fd8e85db5a28d33f8150ebb8dd016653fb39ef1f94f2686bc5'
)

check() {
  chmod +x AppAttic-x86_64.AppImage
  local out
  out="$(./AppAttic-x86_64.AppImage --version)"
  grep -q "AppAttic ${pkgver}" <<<"$out"
}

package() {
  chmod +x AppAttic-x86_64.AppImage
  rm -rf squashfs-root
  ./AppAttic-x86_64.AppImage --appimage-extract

  install -Dm755 AppAttic-x86_64.AppImage "${pkgdir}/opt/appattic/AppAttic.AppImage"
  printf '%s\n' '#!/bin/sh' 'exec /opt/appattic/AppAttic.AppImage "$@"' > appattic-qt.wrapper
  install -Dm755 appattic-qt.wrapper "${pkgdir}/usr/bin/appattic-qt"

  install -Dm644 squashfs-root/usr/share/applications/org.appattic.AppAttic.desktop \
    "${pkgdir}/usr/share/applications/org.appattic.AppAttic.desktop"
  install -Dm644 squashfs-root/usr/share/metainfo/org.appattic.AppAttic.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/org.appattic.AppAttic.metainfo.xml"
  install -Dm644 squashfs-root/usr/share/man/man1/appattic-qt.1 \
    "${pkgdir}/usr/share/man/man1/appattic-qt.1"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/appattic.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/appattic.svg"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/appattic.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/appattic.png"
  install -Dm644 squashfs-root/usr/share/appattic/licenses/Michroma-OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Michroma-OFL.txt"
  install -Dm644 wasmtime-LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-wasmtime"
}
