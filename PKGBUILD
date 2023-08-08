# Maintainer: Nichlas Severinsen <ns@nsz.no>
# Contributor: damir <damir@archlinux.org>
# Contributor: Henk te Sligte <henk@hjts.nl>

pkgname=dasher
pkgver=5.0.0.beta+172+g6958c4ba
pkgrel=1
pkgdesc="Information-efficient text-entry interface, driven by natural continuous pointing gestures"
arch=('any')
license=('GPLv2')
depends=('gtk3' 'libspeechd' 'gcc-libs' 'at-spi2-core' 'expat' 'cairo' 'pango' 'glibc' 'glib2' 'hicolor-icon-theme')
makedepends=('git' 'gnome-common')
url="http://www.gnome.org"
options=('!emptydirs')
source=('git+https://gitlab.gnome.org/GNOME/dasher')
sha256sums=('SKIP')
optional=('speech-dispatcher')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^DASHER_//' -e 's/_/./g'
}

prepare() {
  cd $pkgname
  rm -f m4/glib-gettext.m4
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper --enable-speech
  make
  # Src/Gtk2/generate-schema -s > dasher.gschema.xml
}

package() {
  cd $pkgname
  # install -Dm644 dasher.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/dasher.gschema.xml"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/dasher/COPYING"
}
