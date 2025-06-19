# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Stéphane Caron <tastalian@free.fr>

set -u
pkgname='polyglotman'
pkgver='3.2'
pkgrel='1'
pkgdesc='Reverse compile man pages from formatted form to a number of source formats, formerly rman'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}"
license=('Artistic-1.0')
depends=('glibc')
_srcdir="rman-${pkgver}"
source=("http://downloads.sourceforge.net/${pkgname}/${_srcdir}.tar.gz")
md5sums=('6d1d67641c6d042595a96a62340d3cc6')
sha256sums=('68a130696b251966db10a4774e2bc8083a0147b83f64c11e9bb4cd654da32d5f')

prepare() {
  set -u
  cd "${_srcdir}"
  local _seds=(
    -e 's:\bCFLAGS\b:PG&:g'
    -e '/^PGCFLAGS = / s:$: $(CFLAGS) $(LDFLAGS):g'
  )
  sed -E "${_seds[@]}" -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS+=' -Wno-incompatible-pointer-types -Wno-discarded-qualifiers -Wno-format-security -Wno-unused-result'
  make -s -j1 # -j "$(nproc)" # Too small for threaded make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr"/{bin,share/man/man1}
  make PREFIX="${pkgdir}/usr" BINDIR="${pkgdir}/usr/bin" MANDIR="${pkgdir}/usr/share/man/man1" install
  install -Dpm644 'README-rman.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
