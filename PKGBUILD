# Maintainer: Carl Lei <xecycle@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sebastian Voecking <voeck@web.de>

pkgname=root5
pkgver=5.34.36
pkgrel=1
pkgdesc='C++ data analysis framework and interpreter from CERN.'
arch=('i686' 'x86_64')
url='http://root.cern.ch'
license=('LGPL2.1')
conflicts=('root')
depends=('desktop-file-utils'
	 'fftw'
	 'ftgl'
	 'giflib'
	 'glew'
	 'graphviz'
	 'gsl'
	 'libmysqlclient'
	 'postgresql-libs'
	 'python2'
	 'unixodbc'
	 'shared-mime-info'
	 'xmlrpc-c'
	 'xorg-fonts-75dpi'
	 'gcc-fortran'
	 'libiodbc'
	 'gtk-update-icon-cache'
	 'libafterimage')
install='root.install'
options=('!emptydirs')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
        'root.sh'
        'rootd'
        'root.xml')
md5sums=('6a1ad549b3b79b10bbb1f116b49067ee'
         '0e883ad44f99da9bc7c23bc102800b62'
         'efd06bfa230cc2194b38e0c8939e72af'
         'e2cf69b204192b5889ceb5b4dedc66f7')

build() {
  cd root

  if [ ${CARCH} == 'i686' ]; then
    TARGET=linux;
  else
    TARGET=linuxx8664gcc;
  fi

  msg 'python2 switch'
  find . -type f -exec sed -e 's_#!/usr/bin/env python_&2_' \
                           -e 's/python -O/python2 -O/g' \
                           -e 's/python -c/python2 -c/g' -i {} \;
  sed \
    -e 's/python 2/python2 2/g' \
    -i configure
  sed \
    -e 's/python $(pkgpyexecdir)/python2 $(pkgpyexecdir)/g' \
    -i cint/reflex/python/genreflex/Makefile.am
  sed \
    -e 's/python /python2 /' \
    -i config/genreflex.in config/genreflex-rootcint.in

  # Horid glibc hack
  sed -e 's/__USE_BSD/__USE_MISC/' -i core/base/src/TTimeStamp.cxx

  local sys_libs=""
  for sys_lib in ftgl freetype glew pcre zlib lzma; do
    sys_libs+="--disable-builtin-${sys_lib} "
  done

  ./configure \
    ${TARGET} \
    --prefix=/usr \
    --enable-gdml \
    --enable-gsl-shared \
    --enable-minuit2 \
    --enable-soversion \
    --enable-roofit \
	--disable-builtin-afterimage \
    --with-python-incdir=/usr/include/python2.7 \
    --with-python-libdir=/usr/lib \
    ${sys_libs}

  make
}

package() {
  cd root

  make DESTDIR=${pkgdir} install

  install -D ${srcdir}/root.sh \
    ${pkgdir}/etc/profile.d/root.sh
  install -D ${srcdir}/rootd \
    ${pkgdir}/etc/rc.d/rootd
  install -D -m644 ${srcdir}/root.xml \
    ${pkgdir}/usr/share/mime/packages/root.xml

  install -D -m644 ${srcdir}/root/build/package/debian/root-system-bin.desktop.in \
    ${pkgdir}/usr/share/applications/root-system-bin.desktop
  # replace @prefix@ with /usr for the desktop
  sed -e 's_@prefix@_/usr_' -i ${pkgdir}/usr/share/applications/root-system-bin.desktop

  install -D -m644 ${srcdir}/root/build/package/debian/root-system-bin.png \
    ${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png

  # use a file that pacman can track instead of adding directly to ld.so.conf
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo '/usr/lib/root' > ${pkgdir}/etc/ld.so.conf.d/root.conf

  rm -rf ${pkgdir}/etc/root/daemons
}
