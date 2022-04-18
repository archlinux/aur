# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: onefire <onefire.myself@gmail.com>
#Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
#Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

set -u
pkgname='shc'
pkgver='4.0.3'
pkgrel='1'
pkgdesc='Converts shell script to C source code, and then compiles it. Do NOT use this to encrypt your scripts as it is not meant to be used for that.'
arch=('any')
#_verwatch=('http://www.datsi.fi.upm.es/~frosal/sources/' "${pkgname}-\([0-9\.]\+\)\.tgz" 'l')
#url="${_verwatch[0]}shc.html"
url='https://github.com/neurobin/shc'
license=('GPL')
provides=('shc')
#source=("${_verwatch[0]}${pkgname}-${pkgver}.tgz")
_verwatch=("${url}/releases.atom" "\s\+<title>${pkgname}-\([^<]\+\)</title>.*" 'f') # RSS
source=(
  "${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  'disableencryption.diff'
)
md5sums=('c3f7aef42f12bccd0a54db92e3946f4e'
         'c5c8035f5c5ee7a5dd371e690855b619')
sha256sums=('7d7fa6a9f5f53d607ab851d739ae3d3b99ca86e2cb1425a6cab9299f673aee16'
            '08f9ae1e3fdb2b2f86f9d96257930158fbaa302d3e0d71eadbc5e246fc01150d')

if [ "$(vercmp "${pkgver}" '3.9.0')" -lt 0 ]; then
# Maintained by: Francisco Rosales frosal...fi.upm.es
build() {
  set -u
  cd "${pkgname}-${pkgver}"
  #makefile assumes this symbolic link exists in version 3.8.9
  if [ ! -f "${pkgname}.c" ]; then
    ln -sf "${pkgname}-${pkgver}.c" "${pkgname}.c"
  fi
  make "${pkgname}"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/shc"
  #Install the man page (makepkg automatically gzips man pages)
  #gzip "${pkgname}.1
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  set +u
}
else
# Maintained by: Jahidul Hamid jahidulhamid...yahoo.com

# diff -c3 src/shc.c.orig src/shc.c > ../../disableencryption.diff
prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  #patch -p0 -c < '../disableencryption.diff'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr/'
  fi
  make -j1
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  set +u
}
fi

set +u
