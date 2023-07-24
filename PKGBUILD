# Maintainer: Jan Sonntag <jaso35 at gmail dot com>

pkgname=cantarell-static-fonts
_pkgname=cantarell-fonts
pkgver=0.303.1
pkgrel=2
pkgdesc="Humanist sans serif font - static fonts"
url="https://gitlab.gnome.org/GNOME/cantarell-fonts"
arch=(any)
provides=(cantarell-fonts)
conflicts=(cantarell-fonts)
license=(custom:SIL)
makedepends=(meson appstream-glib python)
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver:0:5}/${_pkgname}-$pkgver.tar.xz"
        "only_remove_overlaps_with_pathops_if_available.patch"
        "bump_requirements.patch")
sha256sums=('f9463a0659c63e57e381fdd753cf1929225395c5b49135989424761830530411'
            '5ebb937d0583773ec383537db8f5d3891f9c8fb7d1b5a9d8f1d16219e17858c8'
            'f37913ac820cb70f13989877a730ee3155b66dc898f2ae083d5e894d8836c48b')

prepare() {
  cd "$_pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/only_remove_overlaps_with_pathops_if_available.patch"
  patch --forward --strip=1 --input="${srcdir}/bump_requirements.patch"

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

