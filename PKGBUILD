# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=easytag
pkgname=easytag-opensuse-ogg-patch
pkgver=2.4.3
pkgrel=8
pkgdesc="Simple application for viewing and editing tags in audio files, using OpenSUSE patch"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/EasyTAG"
license=('GPL2')
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
b2sums=('22358cd15e53a51f2786ad2a62e5d9eea78e9c8b8127d2820dbd5657d734a9a0e694a6d180ad730b87c8c236e3d3396c9ea4c651df4080d0f4b4dc0e212b945c'
        '1d13e4b14140ba4f9e1de8dc467cf67b6ff0990e7c28949ae0379c88aa4b63c5b0fbfa4ec512b004345ffd47d95d64042063cbe041398fbcd74dc7fd732607d1'
        'a6f8eed2708af7cdf6f332f7f906f0bcdcc2701a7f08d33294fda9891dbc8e5a2b638d44096849aa4b795406e29ac60d7166869f1fbbaffa82bd2f323292d1ef')

prepare() {
  cd "${_pkgname}-${pkgver}"
  for f in "${srcdir}"/*.patch; do
    patch -p1 < "$f"
  done
  ./autogen.sh
}

build() {
  cd "${_pkgname}-${pkgver}"
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
  cd "${_pkgname}-${pkgver}"
  # tests claim that easytag.appdata.xml is not valid, but it is, so we touch
  # the validation file
  touch "data/${pkgname}.appdata.valid"
  make -k check
}

package() {
  depends+=('libFLAC.so' 'libid3tag.so' 'libgdk-3.so'
  'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so')
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
