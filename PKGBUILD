# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=abiword-git
pkgver=3.1.0.20780.2a06be6a1
pkgrel=1
epoch=1
pkgdesc="Fully-featured word processor from official GNOME GitLab instance"
arch=(x86_64)
url='http://www.nl.abisource.com/'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  enchant
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  goffice
  gtk3
  hicolor-icon-theme
  libgsf
  libical
  libjpeg-turbo
  libpng
  librsvg
  libx11
  libxml2
  libxslt
  pango
  rasqal
  readline
  redland
  wv
  zlib
)
makedepends=(
  autoconf-archive
  boost
  git
  gobject-introspection
  libwmf
  libwpg
  libwps
  link-grammar
  python-gobject
  telepathy-glib
)
optdepends=(
  'libwmf: WMF Import plugin'
  'libwpg: WordPerfect Graphics Importer plugin'
  'libwps: WordPerfect and Microsoft Works Importer plugin'
  'link-grammar: AbiGrammar plugin'
  'telepathy-glib: Collaboration plugin'
)
provides=('abiword' 'abiword-plugins')
conflicts=('abiword' 'abiword-plugins')
source=(
  git+https://gitlab.gnome.org/World/AbiWord.git
  fix-build-with-libxml2-2.12.patch
)
b2sums=(
  SKIP
  44fc334e9cd53915aede0b7c03c17a9c8099565e895cc43f536d1ca1bdacbea7fe9d202e0638e0f3b78cd893a9bcf1271cc1df13b315e2f664221cd8aa86304a
)
pkgver() {
  cd AbiWord
  major=$(awk '/\[abi_version_major\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  minor=$(awk '/\[abi_version_minor\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  micro=$(awk '/\[abi_version_micro\]/ {print $2}' configure.ac |tr -d \[ |tr -d \] | tr -d \))
  printf "%s.%s.%s.%s.%s"  $major $minor $micro $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
prepare() {
  cd AbiWord

  # Install AppStream data into metainfo directory
  sed -i 's|/appdata|/metainfo|' Makefile.am

  # https://gitlab.gnome.org/World/AbiWord/-/merge_requests/16#note_2018547
  patch -Np1 -i ../fix-build-with-libxml2-2.12.patch
  ./autogen-common.sh
  autoreconf -fi
}
build() {
  cd AbiWord
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-plugins \
    --enable-clipart \
    --enable-templates \
    --enable-introspection
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}
package() {
  cd AbiWord
  make DESTDIR="$pkgdir" install
}
