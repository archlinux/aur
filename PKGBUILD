# Maintainer: eusouobn <eusouobn@users.noreply.github.com>
pkgname=redragon-rgb-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='GTK4/libadwaita app and CLI to configure RGB lighting on Redragon M711 mice and K556 keyboards'
arch=('any')
url='https://github.com/codingkoala/redragon-rgb'
license=('GPL-3.0-or-later')
install=$pkgname.install
depends=(
  'python>=3.10'
  'python-gobject'
  'python-cairo'
  'gtk4'
  'libadwaita>=1.6'
  'libusb'
)
provides=("redragon-rgb=$pkgver")
conflicts=('redragon-rgb')
source=("redragon-rgb_${pkgver}_all.deb::https://github.com/codingkoala/redragon-rgb/releases/download/v${pkgver}/redragon-rgb_${pkgver}_all.deb")
sha256sums=('c765596a9e0f0bc5cf6cd1f079d342035a0e19b112e055a330aa93104133f190')
noextract=("redragon-rgb_${pkgver}_all.deb")

prepare() {
  cd "$srcdir"
  rm -rf deb
  mkdir deb
  cd deb
  ar x "../redragon-rgb_${pkgver}_all.deb"
  tar --zstd -xf data.tar.zst
}

package() {
  cd "$srcdir/deb"

  install -Dm755 usr/bin/redragon-rgb     "$pkgdir/usr/bin/redragon-rgb"
  install -Dm755 usr/bin/redragon-rgb-cli "$pkgdir/usr/bin/redragon-rgb-cli"

  # Debian usa dist-packages; no Arch os módulos devem ficar no site-packages
  # da versão de Python instalada.
  local sitedir
  sitedir="$(/usr/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"].lstrip("/"))')"
  install -dm755 "$pkgdir/$sitedir"
  cp -a usr/lib/python3/dist-packages/redragon_rgb "$pkgdir/$sitedir/"

  install -Dm644 usr/lib/udev/rules.d/70-redragon-rgb.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-redragon-rgb.rules"

  install -Dm644 usr/share/applications/io.github.codingkoala.RedragonRGB.desktop \
    "$pkgdir/usr/share/applications/io.github.codingkoala.RedragonRGB.desktop"

  install -Dm644 usr/share/doc/redragon-rgb/README.md \
    "$pkgdir/usr/share/doc/redragon-rgb/README.md"
  install -Dm644 usr/share/doc/redragon-rgb/copyright \
    "$pkgdir/usr/share/doc/redragon-rgb/copyright"
}
