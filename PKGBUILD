# $Id: PKGBUILD 101758 2013-11-30 18:46:32Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer-properties
_pkgname=gnome-media
pkgver=3.4.0
pkgrel=2
pkgdesc="GStreamer 0.10 configuration tool for GNOME (part of gnome-media)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins')
makedepends=('intltool' 'gnome-doc-utils')
conflicts=('gnome-media')
url="https://git.gnome.org/browse/gnome-media"
install=$pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz
        fix-ui.patch)
sha256sums=('a76fac286f24d3836137ddbaab66f05e19eb5fb83cca6e375dbef040765a1d1f'
            'c37aa39d309c9b8e2322b63499504ebf401dc3592e01c85feef5fb5e79d0e93e')

prepare() {
  cd "$_pkgname-$pkgver"

  # Avoid conflict with other components of gnome-media
  sed -i 's/GETTEXT_PACKAGE=gnome-media-2.0/GETTEXT_PACKAGE=gstreamer-properties/' configure

  # Allow build without sound recorder
  sed -i 's/if test "x$have_gst" = "xyes" && test "x$enable_gstprops" = "xyes";/if test "x$enable_gstprops" = "xyes";/' configure

  # Display in the menu
  sed -i '/NoDisplay=true/d' gstreamer-properties/gstreamer-properties.desktop.in.in

  # Fix UI file
  patch -Np1 -i ../fix-ui.patch
}

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
