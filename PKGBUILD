# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dies <JerryCasiano(at)gmail(dot)com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.8.7
pkgrel=2
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url=https://fontmanager.github.io
arch=(x86_64 i686)
license=(GPL)
depends=(gtk3
         json-glib
         libsoup
         libxml2
         sqlite
         webkit2gtk)
optdepends=(file-roller)
makedepends=(gobject-introspection
             intltool
             libxml2
             meson
             nautilus
             ninja
             vala
             yelp-tools)
_archive="$pkgname-$pkgver"
source=("https://github.com/FontManager/master/releases/download/$pkgver/$_archive.tar.xz"
        "$pkgname-gcc11.patch::https://github.com/FontManager/font-manager/commit/f9c4621389dae5999ca9d2f3c8402c2512a9ea60.patch")
sha256sums=('0375119e332e807c71b1da94fbab2d5d3433e62fa308181afa8558e796ce6cda'
            '2e71c7ee6f8b691b7544afee7dd5f2200df24f8631ce26f9a9744ba413846409')

prepare() {
	cd "$_archive"
	# see https://github.com/FontManager/font-manager/issues/240
	patch -p1 < "../$pkgname-gcc11.patch"
}

build() {
	arch-meson "$_archive" build \
		-Dnautilus=true \
		-Dreproducible=true
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
