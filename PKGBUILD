# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: 2ion <dev@2ion.de>

set -u
pkgname='miller'
pkgver='4.3.0'
pkgrel='1'
pkgdesc='sed, awk, cut, join, and sort for name-indexed data such as CSV and tabular JSON.'
arch=('x86_64' 'i686')
url='https://github.com/johnkerl/miller'
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind' 'asciidoc' 'autoconf')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
#source[0]='https://github.com/johnkerl/miller/archive/master.zip'; _srcdir='miller-master'
sha256sums=('12d8574d1ea6f1390c4cd81446513216590db3e264200050159eba02106fb619')

prepare() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then # 2.2.1 and newer
    autoreconf -fiv
    ./configure --prefix='/usr'
  fi
  set +u
}


build() {
  set -u
  cd "${_srcdir}"
  if grep -q 'am__is_gnu_make' 'Makefile'; then # 2.2.1 and newer
    local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
    make -s -j "${_nproc}"
  else
    make -s -j1
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ -s 'doc/mlr.1' ]; then
    install -d "${pkgdir}/usr/bin"
    #make INSTALLDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}" MANDIR='/usr/share/man/man1' install # pre 2.2.1
    make DESTDIR="${pkgdir}" install
  else
    # for pre 2.2.1, make install is broken. It remakes some of the sources for no reason.
    install -Dpm755 'c/mlr' -t "${pkgdir}/usr/bin/"
    install -Dpm644 'doc/miller.1' -t "${pkgdir}/usr/share/man/man1/"
    ln -sf 'miller.1.gz' "${pkgdir}/usr/share/man/man1/mlr.1.gz"
  fi
  set +u
}
set +u
