# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.15.92
pkgrel=2
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk3' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'clutter-gst' 'clutter-gtk' 'libcanberra' 'gnome-video-effects' 'librsvg' 'gnome-desktop')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection' 'itstool' 'vala' 'gnome-common' 'yelp-tools' 'appstream-glib')
optdepends=('frei0r-plugins: More camera effects')
groups=('gnome-extra')
options=('!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        port-to-clutter-gst-3.patch)
sha256sums=('b7239315f898c988a65c2d3b3320cd963be56a1a3e34afa035a45de4ee797b91'
            '2351cf4147acb5672938728b1838c6104a362706b5fb9964a3196708b544de56')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../port-to-clutter-gst-3.patch
  sed -i -e 's/clutter-gst-2.0/clutter-gst-3.0/g' data/cheese.pc.in
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --disable-schemas-compile --libexecdir=/usr/lib/cheese

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
