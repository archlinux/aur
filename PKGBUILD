# Maintainer: Rafael Maldonado <remdph@gmail.com>
pkgname=nodepdf-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Lightweight, fast desktop PDF viewer built with Electron and React"
arch=('x86_64')
url="https://github.com/remdph/node-pdf"
license=('MIT')
provides=('nodepdf')
conflicts=('nodepdf')
# Runtime deps Electron needs at startup. Most Arch desktops already
# pull these in; listed explicitly so a headless install still works.
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: tray icon support'
)
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.deb::https://github.com/remdph/node-pdf/releases/download/v${pkgver}/node-pdf_${pkgver}_amd64.deb"
)
sha256sums=('45fdb1d4579db9407813645c43f468f5e0e968e2854a3a6dec54bd3c9678e317')

prepare() {
  cd "$srcdir"
  # .deb is just an ar archive — pull out data.tar.* and unpack it.
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  mkdir -p data
  bsdtar -xf data.tar.* -C data
}

package() {
  cd "$srcdir/data"

  # The .deb already lays out files under usr/{bin,lib,share} following the
  # FHS — copy the whole tree verbatim. `/usr/bin/node-pdf` is the launcher
  # script and `/usr/lib/node-pdf/` holds the Electron runtime + binary.
  cp -a usr "$pkgdir/"

  # Surface the bundled LICENSE under the conventional Arch location so
  # pacman -Qi shows it and tools like vrms can find it. The .deb names
  # the file `copyright` (Debian convention) — symlink either name we find.
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  for src in LICENSE copyright; do
    if [[ -f "$pkgdir/usr/share/doc/node-pdf/$src" ]]; then
      ln -sf "/usr/share/doc/node-pdf/$src" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      break
    fi
  done
}
