# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.23.4
pkgrel=1
pkgdesc="Music education and ear training software"
arch=('x86_64')
url="https://www.gnu.org/software/solfege/"
license=('GPL3')
groups=('pro-audio')
depends=('gtk3' 'python-gobject')
makedepends=('ghostscript' 'gnome-doc-utils' 'libxslt' 'lilypond' 'swig'
'texinfo' 'txt2man')
optdepends=('csound: Generate example sounds'
            'timidity++: MIDI playback'
            'mpg123: Mp3 playback'
            'vorbis-tools: Ogg playback'
            'lilypond: Generate print-outs and score sheets'
            'texlive-bin: Generate reports')
source=("https://git.savannah.gnu.org/cgit/solfege.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f2ef7bdb3d1eb15842d803d4d093a177096b6960b211cd3607101f2c03c29fcd3f5151d3b02be4a04236305d18658ba6fa3b5a771b04be4a65f646e27b31914b')

prepare() {
  cd "${pkgname}-${pkgver}"
  # setup version file, so we don't have to use bizarre scripts using git
  echo "version_info ={'git_sha': None}" > "${pkgname}/_version.py"
  # replace wrong cflags assumptions
  sed -E 's|(PYTHON_INCLUDES=).+|\1"$(pkg-config --cflags-only-I python3)"|g' \
      -i acinclude.m4
  aclocal $ACINCLUDE
  autoconf
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  # strip $pkgdir from embedded paths:
  python -m compileall -d "/usr/share/${pkgname}/${pkgname}" \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  python -O -m compileall -d "/usr/share/${pkgname}/${pkgname}" \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}"
}
# vim:set ts=2 sw=2 et:
