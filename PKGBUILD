# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: Christian Peter <prosch88 AT github>
# AUR package for ALEX. This is a -git (VCS) package on purpose:
# pkgver() derives the version from git, so every rebuild tracks
# upstream main and users always get the latest version
# (e.g. with `yay -Syu --devel`).
pkgname=alex-git
_pkgname=ALEX
pkgver=0.7.r0.g0000000
pkgrel=1
pkgdesc="Android Logical Extractor - ADB-based mobile acquisition tool (git)"
arch=('any')
url="https://github.com/prosch88/ALEX"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'tk'
  'android-tools'
  'python-pillow'
  'python-numpy'
)
makedepends=('git' 'python-pip')
optdepends=(
  'python-zeroconf: wireless ADB pairing discovery (else vendored via pip)'
  'python-qrcode: wireless ADB pairing QR codes (else vendored via pip)'
)
provides=('alex')
conflicts=('alex' 'alex-bin')
source=("git+https://github.com/prosch88/ALEX.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ver=$(grep -Po '^a_version\s*=\s*\K[0-9][0-9.]*' alex.py | head -n1)
  [ -n "$ver" ] || ver="0.7"
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  # Application tree
  install -dm755 "$pkgdir/usr/share/alex"
  install -m644 alex.py "$pkgdir/usr/share/alex/"
  cp -a alex "$pkgdir/usr/share/alex/"
  cp -a ressources "$pkgdir/usr/share/alex/"
  cp -a assets "$pkgdir/usr/share/alex/"

  # Vendor PyPI deps into a relocatable dir (no venv absolute paths).
  # Arch-native python-pillow / python-numpy satisfy part of
  # requirements.txt; the rest (adbutils, customtkinter, uiautomator2,
  # pdfme, imagehash, crossfiledialog, ...) are vendored here so the
  # package works without extra AUR python-* packages.
  pip install --no-compile --target="$pkgdir/usr/share/alex/lib" \
    -r requirements.txt

  # Launcher, desktop entry, icon, license
  install -Dm755 packaging/alex "$pkgdir/usr/bin/alex"
  install -Dm644 packaging/alex.desktop "$pkgdir/usr/share/applications/alex.desktop"
  install -Dm644 assets/alex.png "$pkgdir/usr/share/pixmaps/alex.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Drop bundled __pycache__ if pip created any inside lib
  find "$pkgdir/usr/share/alex/lib" -name '__pycache__' -type d -prune -exec rm -rf {} + 2>/dev/null || true
  rm -rf "$pkgdir/usr/share/alex/lib/bin" 2>/dev/null || true
  chmod 755 "$pkgdir/usr/share/alex/ressources/cve/2016-5195/"*/dirtycow \
    "$pkgdir/usr/share/alex/ressources/cve/2016-5195/"*/run-as \
    "$pkgdir/usr/share/alex/ressources/cve/2020-0069/"*/mtk-su \
    "$pkgdir/usr/share/alex/ressources/tar/"*/* 2>/dev/null || true
}
