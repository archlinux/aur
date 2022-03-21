# Maintainer: Jan Sonntag <jaso35 at gmail dot com>

pkgname=cantarell-static-fonts
_pkgname=cantarell-fonts
pkgver=0.303.1
pkgrel=1
pkgdesc="Humanist sans serif font - static fonts"
url="https://gitlab.gnome.org/GNOME/cantarell-fonts"
arch=(any)
provides=(cantarell-fonts)
conflicts=(cantarell-fonts)
license=(custom:SIL)
makedepends=(meson appstream-glib python)
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver:0:5}/${_pkgname}-$pkgver.tar.xz"
        "only_remove_overlaps_with_pathops_if_available.patch"
        "do_not_require_pathops.patch"
        "bump_cu2qu.patch")
sha256sums=('f9463a0659c63e57e381fdd753cf1929225395c5b49135989424761830530411'
            '5ebb937d0583773ec383537db8f5d3891f9c8fb7d1b5a9d8f1d16219e17858c8'
            '037a9ee76801b3b401f5afe592b10c37eb0407e8a8245df8831d001d9f2fdfb9'
            '6bef6ec695177082881dc1ef2c95013f0f294c237e38e4e6b3eacfe52363dcbf')

prepare() {
  cd "$_pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/only_remove_overlaps_with_pathops_if_available.patch"
  patch --forward --strip=1 --input="${srcdir}/do_not_require_pathops.patch"
  patch --forward --strip=1 --input="${srcdir}/bump_cu2qu.patch"

}

build() {
  python -m venv venv
  source venv/bin/activate
  pip install -r $_pkgname-$pkgver/requirements.txt
  arch-meson $_pkgname-$pkgver build -D buildstatics=true -D buildvf=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgname-$pkgver/COPYING
}

