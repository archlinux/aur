# Maintainer: physkets <physkets // at // tutanota dot com>

pkgname=gct
pkgver=6.2.1705709074
pkgrel=2
pkgdesc="The Grid Community Toolkit (GCT) is an open-source fork by the Grid Community Forum (GridCF) of the venerable Globus Toolkit"
url="https://gridcf.org/gct-docs/"
arch=('x86_64')
license=('Apache')
depends=('openssl' 'perl')
source=("https://repo.gridcf.org/gct6/sources/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dc875263f8dec756e99157be94f2671312ee8321378684c4e34fe4d9f9488b8599702154b03be11d80647305e8438d6369d0630a5ae57564d42fecf82d824e5e')


### BUILD OPTIONS
# Set these variables to '1' to enable them
# Doing so will add the requisite build commands,
# as well as add the needed dependencies

# My Proxy logon
_MYPROXY=1
# Common libraries for building grid infrastructure
_CCOMMONLIBS=1
# GridFTP for Data Management
_GRIDFTP=1
# Grid Security
_GSI=1
# GRAM5 for Jobs Management
_GRAM5=0
# GSI OpenSSH
_GSI_OPENSSH=1

### PROCESS BUILD OPTIONS
if (( $_MYPROXY )); then
    _feature_args+=('--enable-myproxy')
fi
if ! (( $_CCOMMONLIBS )); then
    _feature_args+=('--disable-ccommonlibs')
fi
if ! (( $_GRIDFTP )); then
    _feature_args+=('--disable-gridftp')
fi
if ! (( $_GSI )); then
    _feature_args+=('--disable-gsi')
fi
if ! (( $_GRAM5 )); then
    _feature_args+=('--disable-gram5')
fi
if ! (( $_GSI_OPENSSH )); then
    _feature_args+=('--disable-gsi-openssh')
fi

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix="/usr/local" --datarootdir="/usr/share" "${_feature_args[@]}"
  make -j
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
