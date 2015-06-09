# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=gnome-session-properties
pkgver=3.10.0
pkgrel=2
pkgdesc="The GNOME Session Properties Tool"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=(gtk3 hicolor-icon-theme dbus-glib)
makedepends=(gnome-common gtk-doc intltool)
options=('!emptydirs')
install=gnome-session.install
url="http://www.gnome.org"
source=("http://ftp.gnome.org/pub/gnome/sources/gnome-session/${pkgver%.*}/gnome-session-${pkgver}.tar.xz"
        https://raw.githubusercontent.com/chenxiaolong/AUR-Files/b8632ea084b21e5fdef70a5ba7787c5567403146/gnome-session-properties/0001-Remove-unneeded-stuff.patch
        https://raw.githubusercontent.com/chenxiaolong/AUR-Files/b8632ea084b21e5fdef70a5ba7787c5567403146/gnome-session-properties/0002-Fix-GTK-3.14-incompatibilities.patch)
sha512sums=('036adc7ecff7f5aa1319bfac636b6b77925c689cb92880224cf665456dca5a55299025971a2bcdb841e27334ddc0cd6125241b39e48a30c3cc0b02c22612f5c9'
            '4446d916a9fde873ab6aa6186ee9c135e250705c95fb365d6c83d9b2f4fd28f507baabc159f8d53da8f463240c95eb40d9e8aa3115a74b6d2ad624ed8bd948c1'
            'd1983d3747f42eebe69e5459ba7e8e71fc028f94cd4c7429171c78f449235f060757dbbb84296c323047195d9271cf97e6599dca5ee5864999bcce03e7fc8093')

prepare() {
  cd "gnome-session-${pkgver}"
  patch -p1 -i ../0001-Remove-unneeded-stuff.patch
  patch -p1 -i ../0002-Fix-GTK-3.14-incompatibilities.patch
}

build() {
  cd "gnome-session-${pkgver}"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "gnome-session-${pkgver}"
  make DESTDIR="${pkgdir}" install

  files=$(find "${pkgdir}" -name session-properties.png -o -name session-properties.svg)
  for f in ${files}; do
    mv "${f}" "${f/apps\/session-/apps\/gnome-session-}"
  done

  sed -ri '/^Icon/ s/session-/gnome-session-/g' \
    "${pkgdir}/usr/share/applications/gnome-session-properties.desktop"
}
