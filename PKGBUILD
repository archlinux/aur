# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Remi Gacogne <rgacogne-arch at coredump dot fr> # AUR: ht-editor
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Simon Morgan <"mra84964@mra.pb.hx".decode('rot-13')>

set -u
pkgname='ht'
pkgver='2.1.0'
pkgrel='7'
pkgdesc='executable file editor viewer analyzer for MZ, PE and LE. Formerly ht-editor'
arch=('i686' 'x86_64')
#url='http://hte.sourceforge.net/'
#url='http://sourceforge.net/projects/hte/'
url='https://github.com/sebastianbiallas/ht'
license=('GPL')
depends=('gcc-libs' 'ncurses' 'lzo')
# lzo provides lzo2
# depends+=('libx11') # --disable-x11-textmode
makedepends=('texinfo')
conflicts=('ht-editor')
replaces=('ht-editor')
source=("https://downloads.sourceforge.net/sourceforge/hte/${pkgname}-${pkgver}.tar.bz2")
source+=('0000-abs-uint-ambiguous.patch') # Issue #19
md5sums=('09b2a4461d75e9cd03af1cd67fadc1ec'
         '580d1b2879faea507ec30316ef238627')
sha256sums=('31f5e8e2ca7f85d40bb18ef518bf1a105a6f602918a0755bc649f3f407b75d70'
            '58e7a080756eb81ae8ca479d909bcd375e40a359b43e6b70a0177f2c28ace938')

prepare() {
  set -u
  cd "ht-${pkgver}"
  # https://stackoverflow.com/questions/1100090/looking-for-an-efficient-integer-square-root-algorithm-for-arm-thumb2
  #diff -pNau5 htapp.cc{.orig,} > '../0000-abs-uint-ambiguous.patch'
  patch -Nbup0 -i "${srcdir}/0000-abs-uint-ambiguous.patch"
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    ./configure --disable-x11-textmode --enable-release --prefix='/usr'
  fi

  local _mflags=()
  _mflags+='CXXFLAGS=-Wno-narrowing'
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  if [ -z "${MAKEFLAGS:=}" ] || [ "${MAKEFLAGS//-j/}" = "${MAKEFLAGS}" ]; then
    _mflags+=('-j' "${_nproc}")
  fi

  nice make -s "${_mflags[@]}"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # avoid TeX conflict
  mv "${pkgdir}/usr/bin/ht" "${pkgdir}/usr/bin/hte"
  # doc
  install -Dpm0644 doc/*.info -t "${pkgdir}/usr/share/info/"
  install -Dpm0644 doc/{README,*.html} -t "${pkgdir}/usr/share/doc/ht/"
  set +u
}
set +u
