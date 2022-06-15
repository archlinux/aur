# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contirbutor: Eric Bélanger <eric@archlinux.org>

pkgname=xfig-git
_pkgname=xfig
pkgver=3.2.8b.r6.g92215fa
pkgrel=1
pkgdesc="An interactive drawing tool"
arch=('x86_64' 'i686')
url="http://mcj.sourceforge.net/"
license=('custom')
depends=('libjpeg' 'xaw3d' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'libpng' 'libxpm' 'ghostscript')
optdepends=('fig2dev: to use the frontend to convert fig files')
makedepends=('git' 'fig2dev' 'htmldoc')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
options=('!makeflags' '!emptydirs')
source=($pkgname::git+https://git.code.sf.net/p/mcj/xfig
	xfig-aspell.patch xfig-3.2.5-color-resources.patch
        LICENSE)
sha1sums=('SKIP'
          'e563877b201bafb2c80c1caf67812b865b359bda'
          'dd41e0a007bb74b74e1af50b6b04aa6aec61ab22'
          '31edf4cfab708820ea3f114d095dfef5aa88e5aa')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
   patch -p1 -i "${srcdir}/xfig-aspell.patch"
   patch -p1 -i "${srcdir}/xfig-3.2.5-color-resources.patch"
   autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
