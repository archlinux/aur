# Maintainer: Aakash Hemadri <aakashhemadri123@gmail.com>

pkgname=anycubic-slicer
provides=("$pkgname")
pkgver=1.4.4
pkgrel=1
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
  "https://workbentch.s3.us-east-2.amazonaws.com/acslicer/prod/AnycubicSlicerInstaller_v1.3.2_release_20240410.exe"
  "anycubic-slicer"
  "anycubic-slicer.desktop"
)
sha256sums=('a3ce485fff0e5949cbeda49fea127b848cbf5544e3d271599ba5d288222c1bf0'
            '81e84e163b77bf0dd4a0db8fb51d2ded38c6e41160353f22ce1da960f74d0f6d'
            'fa16cc1657321a00681fd6caf3fdb7233b999114b8140f283546094075e3b6dc')

package() {
  mkdir -p "$pkgdir"/usr/{share/applications,bin}
  innoextract -d "$pkgdir"/usr/share/$pkgname -e AnycubicSlicerInstaller_v1.3.2_release_20240410.exe
  # strip app component from extraction
  mv "$pkgdir"/usr/share/$pkgname/app/* "$pkgdir"/usr/share/$pkgname
  # rename non-utf8 file
  mv "$pkgdir"/usr/share/$pkgname/resources/icons/icon-machine—hover_or_sel.svg "$pkgdir"/usr/share/$pkgname/resources/icons/icon-machine-hover_or_sel.svg
  # convmv -f ? -t utf8 "$pkgdir"/usr/share/$pkgname/resources/icons/*
  rm -r "$pkgdir"/usr/share/$pkgname/{app,userappdata}

  install -m 755 -o root -g root anycubic-slicer "$pkgdir"/usr/bin/
  install -m 644 -o root -g root anycubic-slicer.desktop "$pkgdir"/usr/share/applications/
}
