# Maintainer: Can H. Tartanoglu <caniko@codeberg.org>
# Maintainer GPG key: 818D507F1E62139F8A17EAA64623DEA06FDACFE1
pkgname=modde-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Cross-platform game mod manager'
arch=('x86_64')
url='https://codeberg.org/caniko/rs-modde'
license=('GPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc>=2.38' 'libxkbcommon' 'openssl' 'sqlite' 'vulkan-icd-loader' 'wayland')
makedepends=('patchelf')
provides=('modde')
conflicts=('modde' 'modde-git')
source=(
  "modde-${pkgver//_/-}-x86_64-linux.tar.gz::https://codeberg.org/caniko/rs-modde/releases/download/${pkgver//_/-}/modde-${pkgver//_/-}-x86_64-linux.tar.gz"
  "rs-modde-${pkgver//_/-}.tar.gz::https://codeberg.org/caniko/rs-modde/releases/download/${pkgver//_/-}/rs-modde-${pkgver//_/-}.tar.gz"
)
sha256sums=('a7451cc0bef90548cd1e138b1373762660215be728a11f5017bd01319eee4852'
            'b0fd3522892406d018a86cd82219e0356e82642c67fd4ba6525cb71dbc5d6e6c')

package() {
  install -Dm755 modde "$pkgdir/usr/bin/modde"
  install -Dm755 modde-ui "$pkgdir/usr/bin/modde-ui"

  for binary in "$pkgdir/usr/bin/modde" "$pkgdir/usr/bin/modde-ui"; do
    patchelf \
      --set-interpreter /usr/lib/ld-linux-x86-64.so.2 \
      --set-rpath /usr/lib \
      "$binary"
  done

  install -Dm644 rs-modde/dist/modde-ui.desktop "$pkgdir/usr/share/applications/com.tartanoglu.modde.desktop"
  install -Dm644 rs-modde/dist/com.tartanoglu.modde.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.tartanoglu.modde.png"
  install -Dm644 rs-modde/dist/com.tartanoglu.modde.metainfo.xml "$pkgdir/usr/share/metainfo/com.tartanoglu.modde.metainfo.xml"
  install -Dm644 rs-modde/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rs-modde/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 rs-modde/CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
