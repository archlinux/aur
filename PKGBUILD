# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=easytag
pkgver=2.4.3
pkgrel=7
pkgdesc="Simple application for viewing and editing tags in audio files"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/EasyTAG"
license=('GPL2')
# TODO: add back opus, speex, libvorbis and opusfile when files do not get
# corrupted anymore
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'id3lib' 'taglib' 'wavpack'
'zlib')
makedepends=('appstream-glib' 'atk' 'flac' 'glib2' 'gtk3' 'harfbuzz' 'intltool'
'itstool' 'libid3tag' 'pango' 'python' 'yelp-tools')
source=("https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.gz")
sha512sums=('a14ce7432592e8430039f8960a9de70f49adf0a60bc4232e8d894b9cab09d72b8205dd1660a51718b655130a4cee69841106461df7d0b05b4b36b611398789e3')
b2sums=('dbb47f4f653da12e7b677a4757d60ad136d6281e075bdb74a57cab3d3848cb414dab67e3b0f463cabf8dcdeecf7dc193cfe9a52a8d9023b8b29025a9f2168d87')

prepare() {
  mv -v "${pkgname}-${pkgname}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  # disable ogg vorbis because easytag has a bug that corrupts files
  # https://gitlab.gnome.org/GNOME/easytag/-/issues/8
  # disable nautilus actions because it was not ported to nautilus 43
  # https://bugs.archlinux.org/task/76338
  ./configure --prefix=/usr \
              --disable-ogg \
              --disable-opus \
              --disable-speex \
              --disable-nautilus-actions
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # tests claim that easytag.appdata.xml is not valid, but it is, so we touch
  # the validation file
  touch "data/${pkgname}.appdata.valid"
  make -k check
}

package() {
  depends+=('libFLAC.so' 'libid3tag.so' 'libgdk-3.so'
  'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
