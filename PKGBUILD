# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=icu
pkgname=lib32-${_pkgname}44
pkgver=4.4.2
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=(x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs-multilib>=4.7.1-5' 'sh' "${_pkgname}44")
makedepends=('gcc-multilib')
source=(http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz
        icuinfo.makefile)

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32 --std=c++0x'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${srcdir}/${_pkgname}/source
  
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--libdir=/usr/lib32

  cp "${srcdir}"/icuinfo.makefile ./tools/icuinfo/Makefile
  make
}

package() {
  cd ${srcdir}/${_pkgname}/source
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib32/*so,lib32/icu/{Makefile.inc,current,pkgdata.inc}}
  chmod 755 "${pkgdir}"/usr/lib32/libicudata.so.44.2

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}

sha256sums=('2ecefdfb134b5b364ed01c2f613a9ccb11489dbae5857d63cd17ba5b6caca789'
            '213f0a174d24c5db46288514b9b15425f4a3cd9b7b254337d9fe140442139537')
