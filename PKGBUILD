# Maintainer: Aakash Hemadri <aakashhemadri123@gmail.com>

pkgname=anycubic-slicer
provides=("$pkgname")
pkgver=1.4.4
pkgrel=2
pkgdesc="G-code generator for 3D printers (Anycubic fork of Prusa Slicer)"
arch=('x86_64')
url="https://github.com/ANYCUBIC-3D/AnycubicSlicer"
license=('AGPL-3.0-only')
makedepends=('innoextract' 'convmv')
depends=('bash' 'wine')
optdepends=('slicer-udev: 3D printer connection rules')
options=('strip')
# https://store.anycubic.com/pages/firmware-software
source=(
  "https://workbentch.s3.us-east-2.amazonaws.com/acslicer/prod/AnycubicSlicerInstaller_win64_release_v${pkgver}_20240705_202530.exe"
  "anycubic-slicer"
  "anycubic-slicer.desktop"
)
sha256sums=('96ba536a5f524a0ecfe31a196c344746c9ff3bd21aaaa8258120a81cafa5c33d'
            '81e84e163b77bf0dd4a0db8fb51d2ded38c6e41160353f22ce1da960f74d0f6d'
            'fa16cc1657321a00681fd6caf3fdb7233b999114b8140f283546094075e3b6dc')

package() {
  mkdir -p "$pkgdir"/usr/{share/applications,bin}
  innoextract -d "$pkgdir"/usr/share/$pkgname -e AnycubicSlicerInstaller_win64_release_v${pkgver}_20240705_202530.exe
  # strip app component from extraction
  mv "$pkgdir"/usr/share/$pkgname/app/* "$pkgdir"/usr/share/$pkgname
  # rename non-utf8 file
  mv "$pkgdir"/usr/share/$pkgname/resources/icons/icon-machine—hover_or_sel.svg "$pkgdir"/usr/share/$pkgname/resources/icons/icon-machine-hover_or_sel.svg
  # convmv -f ? -t utf8 "$pkgdir"/usr/share/$pkgname/resources/icons/*
  rm -r "$pkgdir"/usr/share/$pkgname/{app,userappdata}

  install -m 755 -o root -g root anycubic-slicer "$pkgdir"/usr/bin/
  install -m 644 -o root -g root anycubic-slicer.desktop "$pkgdir"/usr/share/applications/
}
