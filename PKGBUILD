# Maintainer: leepesjee <lpeschier at xs4all dot nl>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=rasmol-gtk
pkgver=2.7.5.2
pkgrel=2
pkgdesc="A program for molecular graphics visualisation (aka openrasmol)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.openrasmol.org/"
depends=('cvector' 'neartree' 'cqrlib' 'cbflib' 'vte' 'gtk2')
makedepends=('imake')
source=(http://www.rasmol.org/software/RasMol_${pkgver}.tar.gz
        rasmol.png
        rasmol.desktop)
md5sums=('d075ba3eb81604ccf7c0bea2a0039b7b'
         '9eadcb6677c3b600a98e4a251612af15'
         '8ae57862f7b03007778e2be49f84ff03')

prepare () {

  cd ${srcdir}/RasMol-${pkgver}/src
# apply check for 64 bit long data type snippet from build_all.sh script
# set #define _LONGLONG in rasmol.h if present
  gcc checklong.c -o checklong
  VAL=`(./checklong; echo $1)`
  if [ $VAL -gt 4 ]; then
    mv rasmol.h rasmol_amd64_save.h
    echo "#define _LONGLONG"|cat - rasmol_amd64_save.h > rasmol.h
  fi;

# use rasmol_build_options.sh to set Imakefile options
  ./rasmol_build_options.sh --use_gtk

# set PKGDIR in Imakefile
  sed -i "s|PKGDIR = \$(HOME)|PKGDIR = /usr|" ./Imakefile
}

build() {
  cd ${srcdir}/RasMol-${pkgver}/src
# build and install rasmol-gtk
  xmkmf
  mv Makefile Makefile-gtk
  make -f Makefile-gtk clean
  echo " starting build gtk-version"
  make -f Makefile-gtk rasmol
}

package() {

  cd ${srcdir}/RasMol-${pkgver}/src
  make -f Makefile-gtk DESTDIR=$pkgdir install
  mv $pkgdir/usr/bin/{rasmol,rasmol-gtk}

# cleanup
  rm -rf ${pkgdir}/usr/lib64

# install docs
  install -m755 -d ${pkgdir}/usr/share/man/man1
  install -m644 ../doc/rasmol.1.gz ${pkgdir}/usr/share/man/man1
  install -m755 -d ${pkgdir}/usr/share/doc/rasmol
  install -m644 ../doc/{{manual,refcard}*.pdf,rasmol.{doc,hlp,html}}.gz ${pkgdir}/usr/share/doc/rasmol
  gunzip -f ${pkgdir}/usr/share/doc/rasmol/*.gz

# install data
  install -m755 -d ${pkgdir}/usr/share/rasmol/data
  install -m644 ../data/* ${pkgdir}/usr/share/rasmol/data

# install icon
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/rasmol.png ${pkgdir}/usr/share/pixmaps/
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/rasmol.desktop ${pkgdir}/usr/share/applications/
}
