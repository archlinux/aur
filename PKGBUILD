# Maintainer: FabioLolix <fabio.loli@disroot.org>
# Contributor: Zdeněk Janeček <jan.zdenek@gmail.com>

pkgname=entangle
pkgver=3.0
pkgrel=3
pkgdesc="GTK graphical interface for tethered photography with digital cameras powered by libgphoto2"
arch=(x86_64 i686 aarch64)
url="https://gitlab.com/entangle/entangle"
license=(GPL-3.0-or-later)
depends=(dbus-glib gdk-pixbuf2 gtk3 libgphoto2 libgudev gobject-introspection lcms2
         libpeas libgexiv2 libraw adwaita-icon-theme gstreamer itstool gst-plugins-base-libs)
makedepends=(intltool meson gtk-doc glib2-devel)
source=("http://entangle-photo.org/download/sources/${pkgname}-${pkgver}.tar.xz"
        "https://github.com/FabioLolix/AUR-artifacts/raw/master/entangle-fix_build_for_meson_>=0.60.0.patch")
sha256sums=('9285ebab273ebe788d39a7c1bf19717cc6312cfcaa0bc55d65cf5a8d4f42a545'
            'b816b7fdbe121044a8cafcf9648e770a91a4df38b0758781276db22c8d29cd50')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../"entangle-fix_build_for_meson_>=0.60.0".patch
}

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "${pkgname}-${pkgver}"
  sed -i "s/'libraw_r'/'raw_r'/g" meson.build
  arch-meson build -Denable-gtk-doc=true
  ninja -C build all
}

check() {
  cd "${pkgname}-${pkgver}"
  ninja -C build test
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
}
