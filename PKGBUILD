# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
pkgver=0.3.0
pkgrel=2
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/Vysp3r/ProtonPlus/commit/b079df4ff9c793ded8967c8a930a1bb49c652bd4.patch'
        'https://github.com/Vysp3r/ProtonPlus/commit/a0147ff163a4df77d4461ba17927c54baf107bb7.patch'
        'https://github.com/Vysp3r/ProtonPlus/commit/c22ff10dc56b69cdff203020fcb7417e128778ca.patch'
        'https://github.com/Vysp3r/ProtonPlus/commit/2a75650332f842f09a3d3bd39f397ff9e6f28956.patch')
sha256sums=('b09ff0015111bcd895f7bae74cb04e7dc931bda22fe7ae62b852fec1a72ddd2c'
            'b9934fa7a054ced1575b598377b6b29835001af3fb11eab44bd380bf3b525fa1'
            '974e898e7ca14ae92f3eea59d332e72b5cac8ded6ab95f46b37078fff38be3c3'
            'a2753a167e367fa45bc11cea82617df2322ed1e2a0320fa4ad313d22b23a52dc'
            '2b4882d407d7b78502ae814e8b8e6fa9b4234f682340f7f63bbc5ca04a843897')

prepare() {
  cd "ProtonPlus-$pkgver"

  # Correct desktop file category
  # https://github.com/Vysp3r/ProtonPlus/pull/39
  sed -i 's/Games;/Game;/g' data/com.vysp3r.ProtonPlus.desktop

  # Fix tool installation
  patch -Np1 -i ../b079df4ff9c793ded8967c8a930a1bb49c652bd4.patch

  # Test to fix installer
  patch -Np1 -i ../a0147ff163a4df77d4461ba17927c54baf107bb7.patch

  # Fix installed tools finder
  patch -Np1 -i ../c22ff10dc56b69cdff203020fcb7417e128778ca.patch

  #  Fix installed tools not showing up properly
  patch -Np1 -i ../2a75650332f842f09a3d3bd39f397ff9e6f28956.patch
}

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build

  cd "ProtonPlus-$pkgver"
  appstream-util validate-relax --nonet data/*.appdata.xml
  desktop-file-validate data/*.desktop
}

package() {
  meson install -C build --destdir "$pkgdir"
}
