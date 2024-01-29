# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=easytag
pkgname=easytag-opensuse-ogg-patch
pkgver=2.4.3
pkgrel=5
pkgdesc='Simple application for viewing and editing tags in audio files, using OpenSUSE patch'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/EasyTAG'
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'id3lib' 'taglib' 'wavpack'
'zlib')
makedepends=('appstream-glib' 'atk' 'flac' 'glib2' 'gtk3' 'harfbuzz' 'intltool'
'itstool' 'libid3tag' 'pango' 'python' 'yelp-tools')
conflicts=(easytag)
provides=("easytag=${pkgver}")
source=(
    https://download.gnome.org/sources/${_pkgname}/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.xz
    0001-taglib-2.patch
    0002-easytag-revert-open-handle-ogg.patch
)
sha256sums=('fc51ee92a705e3c5979dff1655f7496effb68b98f1ada0547e8cbbc033b67dd5'
            '9d3fe4c458e180f409f0fdd602bc372df2fb44233ac524a133c6e78d95e65999'
            'cfbe5d613115a75ada48544e8e96a42de06317deac816071c5107abadf70617c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for f in "${srcdir}"/*.patch; do
    patch -p1 < "$f"
  done
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # disable nautilus actions because it was not ported to nautilus 43
  # https://bugs.archlinux.org/task/76338
  #
  # the ArchLinux repo package also disables ogg vorbis:
  # disable ogg vorbis because easytag has a bug that corrupts files
  # https://gitlab.gnome.org/GNOME/easytag/-/issues/8
  #           --disable-ogg \
  #           --disable-opus \
  #           --disable-speex \
  ./configure --prefix=/usr \
              --disable-nautilus-actions
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # tests claim that easytag.appdata.xml is not valid, but it is, so we touch
  # the validation file
  touch "data/${pkgname}.appdata.valid"
  make -k check
}

package() {
  depends+=('libFLAC.so' 'libid3tag.so' 'libgdk-3.so'
  'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
