# Maintainer: Philippe DUCRETTET <ecolinux@gmx.fr>

pkgname=fvwm-cvs
pkgver=2.6.6
pkgrel=3
pkgdesc="A powerful ICCCM2 compliant multiple virtual desktop window manager for X11"
arch=('i686' 'x86_64')
url="http://fvwm.org"
license=('GPL')
depends=('imlib' 'fribidi' 'perl' 'libstroke' 'libxpm' 'libxinerama' 'readline' 'libxft' 'librsvg' 'libxcursor' 'libpng')
makedepends=('cvs' 'gcc' 'make' 'autoconf' 'automake' 'libxslt')
provides=('fvwm')
conflicts=('fvwm' 'fvwm-patched' 'fvwm+' 'fvwm+-cvs')
replaces=('fvwm')
options=('!emptydirs' '!makeflags')
cvsroot=":pserver:anonymous:guest@cvs.fvwm.org:/home/cvs/fvwm"
cvsmod="fvwm"
source=(fvwm.desktop 
	configure.ac-makefile.am.patch )

patched() {
  cd "${srcdir}/fvwm"
  #Patching

  #Patch configure.ac and makefile.am files
  echo "** Patch configure.ac file and makefile.am files **"
  patch -p0 < $startdir/configure.ac-makefile.am.patch || return 1
}

build() {
  cd $startdir/src
  msg "Connecting to fvwm.org CVS server....please enter 'guest'"
  cvs -d $cvsroot login
  msg "Checking out fvwm"
  cvs -d $cvsroot co -r branch-2_6 $cvsmod
  cd $startdir/src/fvwm
patched
  utils/configure_dev.sh
./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --with-stroke-library  \
    --enable-perllib \
    --enable-xinerama \
    --enable-bidi \
    --enable-nls --enable-iconv \
    --enable-xft
  make
}

package() {
  cd "$srcdir/fvwm"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 sample.fvwmrc/{decor_examples,DecorMwm,DecorWin95,new-features,system.*} "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/fvwm/COPYING"
}

md5sums=('a12c52729a74355838404ee2f5716e0c'
         '1cb3ab5534d6828d0d4eb8e736293aa2')
