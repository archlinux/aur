# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Sven Kauber <celeon@gmail.com>

set -u
pkgname='lsat'
pkgver='0.9.8.6'
pkgrel='1'
pkgdesc='A post install security auditor for Linux/Unix'
arch=('i686' 'x86_64')
url='http://usat.sourceforge.net/'
license=('GPL')
depends=('popt')
optdepends=('nmap' 'lsof')
_verwatch=('https://sourceforge.net/projects/usat/files/' "/projects/usat/files/${pkgname}-\(.*\)/stats/timeline" 'l')
source=("http://usat.sourceforge.net/code/${pkgname}-${pkgver}.tgz")
md5sums=('6c1924001ddac03b7c0e5eec589c47b7')
sha256sums=('13dfd05040d360eddb95185f3b2122ba98387374d3052f2d0317a8eec838e537')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  sed -e '/^dist_man_MANS = / s:lsat.1:lsatnull.1:g' -i src/Makefile.*
  echo > src/lsatnull.1
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ];then
    ./configure \
      --prefix='/usr' \
      --bindir='/usr/bin' \
      --mandir='/usr/share/man'
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}" CFLAGS="${CFLAGS}"
  #make manpage
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -j1 \
    DESTDIR="${pkgdir}" \
    INSTALL='/bin/install' \
    install # installman
  rm "${pkgdir}/usr/share/man/man1/lsatnull.1"
  set +u
}
set +u
