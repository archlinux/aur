# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Philippe DUCRETTET <ecolinux@gmx.fr>

pkgname=fvwm-cvs
_pkgname=fvwm
pkgver=2.6.6
pkgrel=4
pkgdesc="A powerful ICCCM2 compliant multiple virtual desktop window manager for X11"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL' 'custom')
depends=('fribidi' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'gtk' 'rplay')
makedepends=('cvs' 'libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support'
	    'python: for fvwm-menu-desktop')
provides=('fvwm')
conflicts=('fvwm')
options=('!emptydirs' '!makeflags')
cvsroot=":pserver:anonymous:guest@cvs.fvwm.org:/home/cvs/fvwm"
cvsmod="fvwm"
source=(fvwm.desktop
	autoconf.patch)
md5sums=('a12c52729a74355838404ee2f5716e0c'
         '1e8b10b79a17e84c89f3145ce417b3f0')

prepare() {
  msg "Connecting to fvwm.org CVS server....please enter 'guest'"
  cvs -d $cvsroot login
  msg "Checking out fvwm"
  cvs -d $cvsroot co -r branch-2_6 $cvsmod
  cd ${_pkgname}
  patch -Np2 -b -z .orig <"${srcdir}/autoconf.patch"
}

build() {
  cd ${_pkgname}
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --with-stroke-library \
    --enable-perllib \
    --enable-xinerama \
    --enable-bidi \
    --enable-nls --enable-iconv \
    --enable-xft
  make V=0
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m644 sample.fvwmrc/{decor_examples,DecorMwm,DecorWin95,new-features,system.*} "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
