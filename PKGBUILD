# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=snowflake-client
pkgver=2.4
pkgrel=2
pkgdesc="Snowflake Database command line and JDBC client"
arch=('i686' 'x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
depends=(gcc-libs java-environment bash libtinfo)
source=(sfsql.patch)
md5sums=('3ab11cead59dab3a869d22f15cdff050')

_vpkg=snowflake_client.tar.gz

build() {
  msg "You need a full, licensed copy of the client in order to install it"
  msg "Searching for ${_vpkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
    error "Snowflake client package not found, please type absolute path to ${_vpkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
      error "Unable to find Snowflake client package." && return 1
    fi
  fi
  msg "Found package, unpacking..."
  tar -xzf "${pkgpath}/${_vpkg}" -C "${srcdir}"
  
  cd "${srcdir}"
  patch -Np1 -i "${srcdir}/sfsql.patch"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  cp -r "${srcdir}/client/"* "${pkgdir}/opt/${pkgname}" -R
  ln -s /opt/${pkgname}/sfsql "${pkgdir}"/usr/bin/sfsql
}
