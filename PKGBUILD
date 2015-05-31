# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=vertica-client
pkgver=7.1.1
_pkgver=7.1.1-0
pkgrel=2
pkgdesc="Client for the Vertica Analytic Database"
arch=('i686' 'x86_64')
url="https://www.vertica.com/"
license=('custom: commercial')
PKGEXT=.pkg.tar
install=${pkgname}.install
depends=(zlib gcc-libs)
optdepends=('java-environment: Needed for the JDBC client')
source=(LICENSE)
md5sums=('411c631addb1ecdc934c0cb2fab1e52e')

if test "$CARCH" == i686; then
  __vertica_arch=i386
elif test "$CARCH" == x86_64; then
  __vertica_arch=x86_64
fi

_vpkg=vertica-client-${_pkgver}.linux.${__vertica_arch}.tar.gz

build() {
  msg "You need a full copy of the client in order to install it"
  msg "You can download it here: https://my.vertica.com/download-community-edition/#clients"
  msg "Searching for ${_vpkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
    error "Vertica client package not found, please type absolute path to ${_vpkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
      error "Unable to find Vertica client package." && return 1
    fi
  fi
  msg "Found package, unpacking..."
  tar xf "${pkgpath}/${_vpkg}" -C "${srcdir}"
}

package() {
  install -d "${pkgdir}/usr/share/licenses/vertica-client"
  install -d "${pkgdir}/opt"
  
  cp -r "${srcdir}/opt/"* "${pkgdir}/opt/" -R
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
