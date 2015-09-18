# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andrew Grigorev <andrew@ei-grad.ru>

# see src/examples

set -u
_gitname='SICOM'
_pkgname='rlib'
pkgname="lib${_pkgname}" # libr seems a bit short
pkgver='2.0.9'
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
sha256sums=('efa181857c536ef04da0546e2b82f079883ef4bbda043ba368178245e41d4f25')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"
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
