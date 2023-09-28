# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Oleg Finkelshteyn <olegfink@gmail.com>

pkgname='ripit'
pkgver='4.0.0_rc_20161009'
pkgrel='8'
pkgdesc='Command line tool to rip tracks from audio cds and encode them'
arch=('any')
url='https://www.ripit.pl'
license=('GPL')
depends=('cdparanoia' 'cddb_get' 'perl-xml-simple' 'perl-mp3-tag' 'perl-libwww')
optdepends=(
  'flac: Encoding (FLAC)'
  'lame: Encoding (MP3)'
  'vorbis-tools: Encoding (Vorbis)'
  'wavpack: Encoding (WAV)'
  'musepack-tools: Encoding (MPC/MPP)'
  'faac: Encoding (M4A/AAC)'
  'normalize: Normalizing'
  'perl-libwww: Submitting to CDDB' 
  'perl-webservice-musicbrainz: Tagging (Musicbrainz.org)'
  'perl-musicbrainz-discid: Tagging (Musicbrainz.org)'
)
source=("https://www.ripit.pl/ripit/ripit-${pkgver}.tar.bz2"
        "fix-musicbrainz.patch")
sha256sums=('2434ec6e5b8044de9b081cb7a0c713e52a09443270c6abe9f415a006ecda0c66'
            '1ecb55c3a87db018b7dc74083fd48a3333b0b42b9771095cb84b68c1e30122f4')
backup=('etc/ripit/config')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # replace freedb with gnudb
  sed 's/CDDBHOST=freedb.org/CDDBHOST=gnudb.org/' -i config
  sed 's/mirror=freedb/mirror=gnudb/' -i config
  patch -Np1 -i ../fix-musicbrainz.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=${pkgdir}/usr etcdir=${pkgdir}/etc/ripit mandir=${pkgdir}/usr/share/man/man1 INSTALL=/usr/bin/install install
}
