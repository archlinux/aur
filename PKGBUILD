# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=olvwm
pkgver=4.4
_srcname=xview
_srcver=3.2p1.4
_patchset=28.2
pkgrel=6
pkgdesc="Open Look Virtual Window Manager"
arch=('i686' 'x86_64')
url=https://en.wikipedia.org/wiki/Olwm
license=('custom')
depends=('libxpm')
makedepends=('imake' 'gcc54')
source=(http://http.debian.net/debian/pool/main/x/${_srcname}/${_srcname}_${_srcver}.orig.tar.gz
        http://http.debian.net/debian/pool/main/x/${_srcname}/${_srcname}_${_srcver}-${_patchset}.debian.tar.xz
	disable_rpc_compile.patch
	use-gcc54.patch)
sha256sums=('fcc88f884a6cb05789ed800edea24d9c4cf1f60cb7d61f3ce7f10de677ef9e8d'
            'c84f18a588b848a95f2fed08c3d0514e96792408ebf8120e53e585efd3045f96'
            '4b5e6171a7894597c1e05554df51eb4a9dc56c040728438d69834c962f7b35fd'
            'ef5aef39ea7e270a96149e37c5214eeecc7d86a47713fffa107fef4124054b02')

prepare() {
  cd ${srcdir}/${_srcname}-${_srcver}

  # Debian patches
  for x in $(ls ${srcdir}/debian/patches | grep -v series); do
    patch -Np1 -i ${srcdir}/debian/patches/${x};
  done

  # Build fix for rpc.h which is no longer included in glibc
  patch -Np1 -i "${srcdir}/disable_rpc_compile.patch"

  # Fix imake path
  sed -i 's@/usr/bin/X11/imake@/usr/bin/imake@g' imake
  
  # Fix install dirs
  sed -i 's@OPENWINHOME=/usr/openwin@OPENWINHOME=/usr@g' Build-LinuxXView.bash

  # Use gcc 5.4 as compiling with gcc 8 seems to cause a stack
  # smash error on startup
  patch -Np1 -i "${srcdir}/use-gcc54.patch"

  chmod 755 Build-LinuxXView.bash
}

build() {
  cd ${srcdir}/${_srcname}-${_srcver}
  ./Build-LinuxXView.bash libs olvwm
}

package() { 
  cd ${srcdir}/${_srcname}-${_srcver}

  # Install olvwm
  cd clients/${pkgname}-4.1
  make DESTDIR=${pkgdir} install install.man

  # Add license
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LEGAL_NOTICE ${pkgdir}/usr/share/licenses/${pkgname}/

  # Fix man location
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/man
}
