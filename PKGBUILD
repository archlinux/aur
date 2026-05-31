# Maintainer: PhotonX <photon89 at googlemail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>

pkgname=glabels-light
_pkgname=glabels
pkgver=3.4.1
pkgrel=2
pkgdesc='Creating labels and business cards the very easy way'
arch=(x86_64)
url='https://github.com/jimevins/glabels'
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND CC-BY-SA-3.0 AND MIT')
depends=(librsvg dconf desktop-file-utils xdg-utils)
optdepends=('evolution-data-server: import Evolution contacts'
	'qrencode: use QR codes'
	'iec16022: use barcodes')
makedepends=(
  git
  glib2-devel
  gtk-doc
  intltool
  yelp-tools
)
source=(
  "https://download.gnome.org/sources/glabels/3.4/glabels-3.4.1.tar.xz"
  glabels-externs.patch
  glabels-incompatible-pointer.patch
  glabels-desktop-metainfo.patch
  glabels-xml-unzip.patch
)
b2sums=(
  87da586052995a61b1031c5598a21142e525851c5d94b2870e6f62b0d2a6227f44b55ce1aaf6a4c52bd6bb81d9005fde0e58befe26834acb37f4b6728a378cdd
  3df1dbfedaf8773626c11c44676268a33696588dc91a87f7607a9e7ede7ed1883adc5a34ca0632d513cdd99782f58b0225dde1c5ca65b374d0c41e20eaacc469
  ae3b0400a13a49fd2d43b4fd91589eafefed5896d43f39fae4eee0a0eab749e4eee37833aee77d2acc1b470639e755c59c97e8dbe8beb686a30693cb7f6e4111
  380107802dc3a1cdfa2ed5a913ab6f6f1ec5044b1322e0babf195ff89df561c0ee2813cdbbecebb728f5ed1ba37f6870ad561b2847855ab9c346b18a9d3c97e7
  b9c2a01b57b3fc75f03ae157e64e452e32ced8135c786f41748405f321917ee2cbdaffb1e4ae6729914615261e3a74445ef27018e97bdea374872737f1441c2b
)
validpgpkeys=(17B6E6AA6DCE0EA8DE4864502C2EF9A1272BB12F) # Jim Evins <evins@snaught.com>

prepare() {
  cd $_pkgname-$pkgver

  # Fix build
  patch -p1 < ../glabels-externs.patch
  patch -p1 < ../glabels-incompatible-pointer.patch

  # Rename desktop file to match with program name and fix metainfo
  patch -p1 < ../glabels-desktop-metainfo.patch

  # Unzip XML when opening file (required with recent libxml2 versions)
  # https://github.com/j-evins/glabels-gtk/pull/85
  patch -p1 < ../glabels-xml-unzip.patch

  autoreconf -fiv
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" COPYING*
}
