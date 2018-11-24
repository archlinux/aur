# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Alec Ari <neotheuser@ymail.com>

pkgname=linuxcnc
pkgver=2.7.14
pkgrel=2
pkgdesc="It can interpret G-code and simulate a CNC machine (formerly EMC2)."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linuxcnc.org/"
depends=('bc' 'bwidget' 'tcl' 'tk' 'xorg-server' 'python2-imaging' 'tkimg' 'python2-gtkglext' 'tclx' 'boost' 'boost-libs' 'libtirpc' 'procps-ng' 'psmisc')
source=($_gitname::"git://github.com/LinuxCNC/linuxcnc.git#tag=v$pkgver" 'linuxcnc.sh' 'libtirpc.patch')
sha256sums=('72e4dad9c929b00d2a73d125d86f18600dc1c852abadcd3947fa0a7cbc28c88e'
            'c0f1ea0d8c20baa5d69d89a1d6eb3549bc57cc56ff1a0af3d5b9917cbc6211a7'
            '92f63a3f58173fa9463329f74cff7365bfefd937729a70bbdc52684d9252333f')
makedepends=('git' 'intltool')
PKGEXT='.pkg.tar'

build () {
  find . -iname fixpaths.py -o -iname checkglade -o -iname update_ini|xargs perl -p -i -e "s/python/python2/"
  cd $srcdir/$_gitname/src

  patch -Np2 -i $srcdir/libtirpc.patch

  ./autogen.sh
  ./configure --with-realtime=uspace --without-libmodbus --prefix=/usr --with-python=/usr/bin/python2.7 --enable-non-distributable=yes
  make
}

package() {
  cd $srcdir/linuxcnc/src
  make install DESTDIR=${pkgdir} || return 1
  #Stop hiding it from GNOME
  cp -PR $srcdir/linuxcnc/share/applications $pkgdir/usr/share/
  mkdir -p $pkgdir/etc/xdg
#  echo To avoid conflict with linux-manpages...
#  mv -v $pkgdir/usr/share/man/man9/abs.9.gz $pkgdir/usr/share/man/man9/linuxcnc_abs.9.gz
  cp -PR $srcdir/linuxcnc/share/menus $pkgdir/etc/xdg/
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  ln -s /usr/bin/linuxcnc ~/Desktop/linuxcnc
}

