# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: onefire <onefire.myself@gmail.com>
#Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
#Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

set -u
pkgname='shc'
pkgver='3.9.3'
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
source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b7120f66177a35af7dc42763a55e7ade3a80043c0188739e57bcc648a5ac4bb3')

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
build() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr/'
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
