# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Alec Ari <neotheuser@ymail.com>
#
# Note: if configure script complains about missing 'bwidget' execute:
# sudo chmod -R o+rX /usr/lib/tcl8.6/bwidget-1.9.16

pkgname=linuxcnc-sim
pkgver=2.7.15
pkgrel=7
pkgdesc="It can interpret G-code and simulate a CNC machine (formerly EMC2)."
arch=('i686' 'x86_64')
license=('custom: unredestributable')
url="http://linuxcnc.org/"
depends=('bc' 'bwidget' 'tcl' 'tk' 'xorg-server' 'python2-imaging' 'tkimg' 'python2-gtkglext' 'tclx' 'boost' 'boost-libs' 'libtirpc' 'procps-ng' 'psmisc' 'python2-yapps2' 'python2-gobject2' 'boost-python2' 'boost-python2-libs' 'libusb')
install=$pkgname.install
_gitname='linuxcnc'
source=($_gitname::"git+https://github.com/LinuxCNC/linuxcnc.git#tag=v$pkgver" 'linuxcnc-sim.sh' 'libtirpc.patch')
#source=($_gitname::'git://git.linuxcnc.org/git/linuxcnc.git#tag=739df958aca9d246daad36f439c82bfbeac681b9' 'boost.patch')
md5sums=('SKIP'
         '3fb3f231cfefdfe1fa4d600ecbf4a3cb'
         '42770a1aa791172358700e4d5af335ed')
makedepends=('git' 'intltool')
#PKGEXT='.pkg.tar'

#pkgver() {
#  cd "$srcdir/$_gitname"
#  git log -1 --format="%cd" --date=short | tr -d '-'
#}

build () {
  find . -iname fixpaths.py -o -iname checkglade -o -iname update_ini|xargs perl -p -i -e "s/python$/python2/"
  cd $srcdir/$_gitname/src

  patch -Np2 -i $srcdir/libtirpc.patch

  ./autogen.sh
  ./configure --with-realtime=uspace --without-libmodbus --prefix=/usr --with-python=/usr/bin/python2.7 --enable-non-distributable=yes

  sed -i "s/^char FileName\[500\];$/static char FileName[500];/" hal/classicladder/files_project.c
  make
}

package() {
  cd $srcdir/linuxcnc/src
  make install DESTDIR=${pkgdir} || return 1
  #Fix lsmod
#  sed -i 's/sbin/bin/g' $pkgdir/etc/init.d/realtime
  #Stop hiding it from GNOME
  cp -PR $srcdir/linuxcnc/share/applications $pkgdir/usr/share/
  mkdir -p $pkgdir/etc/xdg
#  echo To avoid conflict with linux-manpages...
#  mv -v $pkgdir/usr/share/man/man9/abs.9.gz $pkgdir/usr/share/man/man9/linuxcnc_abs.9.gz
  cp -PR $srcdir/linuxcnc/share/menus $pkgdir/etc/xdg/
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -D -m644 "${srcdir}/linuxcnc/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

