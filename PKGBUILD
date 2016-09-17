# $Id$
# Maintainer: Malah <malah@neuf.fr>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono42
_pkgname=mono
pkgver=4.2.4.4
_pkgver=4.2.4
pkgrel=2
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL2.1' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=3.8' 'sh' 'python' 'ca-certificates')
install="${pkgname}.install"
source=(http://download.mono-project.com/sources/mono/${_pkgname}-${pkgver}.tar.bz2
        "mono42-dev-env")
sha256sums=('ae74292c672e276276edc5461914f3e184d427a7a2ac099d3ce2640abe5dc0c6'
            '2de4aa94b4f59a840fb5d75f2fb6016dd4f666832fd831316402cffd7187752e')

build() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
	
  # build mono
  ./configure \
    --prefix=/opt/${pkgname} \
    --with-mcs-docs=no 
  make

  # build jay
  cd "${srcdir}"/${_pkgname}-${_pkgver}/mcs/jay
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  make DESTDIR="${pkgdir}" install

  # install jay
  pushd "${srcdir}"/${_pkgname}-${_pkgver}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/opt/${pkgname} INSTALL=../../install-sh install
  popd

  #install license
  mkdir -p "${pkgdir}"/opt/${pkgname}/licenses/${_pkgname}
  install -m644 mcs/MIT.X11 "${pkgdir}"/opt/${pkgname}/licenses/${_pkgname}/

  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" "${pkgdir}"/opt/${pkgname}/lib/pkgconfig/mono.pc
  sed -i -e "s:/2.0/:/4.5/:g" "${pkgdir}"/opt/${pkgname}/lib/pkgconfig/mono-nunit.pc
  
  #install mono42-dev-env
  install -m644 "${srcdir}/mono42-dev-env" "${pkgdir}"/opt/${pkgname}/mono42-dev-env
}
