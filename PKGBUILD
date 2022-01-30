# Maintainer: FabioLolix <fabio.loli@disroot.org>
# Contributor: Zdeněk Janeček <jan.zdenek@gmail.com>

pkgname=entangle
pkgver=3.0
pkgrel=2
pkgdesc="GTK graphical interface for tethered photography with digital cameras powered by libgphoto2"
arch=(x86_64 i686)
url="https://entangle-photo.org/"
license=(GPL3)
depends=(dbus-glib gdk-pixbuf2 gtk3 libgphoto2 libgudev gobject-introspection lcms2
         libpeas libgexiv2 libraw adwaita-icon-theme gstreamer itstool gst-plugins-base-libs)
makedepends=(intltool meson gtk-doc)
source=("http://entangle-photo.org/download/sources/${pkgname}-${pkgver}.tar.xz"
        "https://gitlab.com/entangle/entangle/-/commit/54795d275a93e94331a614c8712740fcedbdd4f0.patch")
sha256sums=('9285ebab273ebe788d39a7c1bf19717cc6312cfcaa0bc55d65cf5a8d4f42a545'
            '6cb850db85e7efe4dbb74e00ed4c3beabe0d0559e33cde26c131bb980d9f6491')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../54795d275a93e94331a614c8712740fcedbdd4f0.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/'libraw_r'/'raw_r'/g" meson.build
  meson -Denable-gtk-doc=true build-dir --prefix=/usr
  ninja -C build-dir all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ninja -C build-dir test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build-dir install
}
