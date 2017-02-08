# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

# see src/examples

set -u
_gitname='SICOM'
_pkgname='rlib'
pkgname="lib${_pkgname}" # libr seems a bit short
pkgver='2.0.16'
# 2.0.10 won't compile
pkgrel='1'
pkgdesc='Advanced reporting engine that generates professional reports in PDF, HTML, CSV, and text formats from a simple XML definition language.'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sicompos.com/"
license=('GPL')
depends=('gd' 'libxml2' 'libmariadbclient' 'libjpeg-turbo')
#makedepends=('docbook-utils' 'texlive-bin' 'texlive-core') # --disable-doc
optdepends=(
  #'python2: python bindings'
  'php: php bindings'
  #'java: java bindings'
  #'perl: perl bindings'
  #'csharp'
)
provides=("${_pkgname}" 'libr')
_giturl="https://github.com/${_gitname}/${_pkgname}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
#source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz") # <=1.3.7
source=("${_pkgname}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz")
sha256sums=('c2803ec9bbf4711d4267091f6ddce66294bae59f0c6ce85bfa7c13136e28afa8')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"
  export CPPFLAGS="${CPPFLAGS} -O2 -Wno-misleading-indentation -Wno-unused-parameter -Wno-unused-result"
  if [ -f 'autogen.sh' ]; then
    # Postgres wants a config file. Perl won't compile. Python configure claims no but is really yes. db2pdf doesn't work.
    # Configure gives us a Python.h error that needs to be fixed.
    # Python tests error: ImportError: No module named '_rlib'
    ./autogen.sh --prefix='/usr' --enable-utf8 --enable-python --disable-postgres --disable-perl --disable-doc
  else
    ./configure --prefix='/usr' --enable-utf8 --enable-python --with-pythonver='2.7'
    # From http://sisyphus.ru/en/srpm/Branch5/librlib/spec Version: 1.3.7
    #./configure --disable-static --with-pythonver=%__python_version --disable-postgres --disable-php --disable-perl --disable-python
  fi
  #sed -i -e 's: -Werror::g' -e 's: -Wextra::g' -e 's: -Wall::g' 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Don't know where they go but I know where they don't go.
  rm -rf "${pkgdir}/usr/etc"
  set +u
}
set +u
