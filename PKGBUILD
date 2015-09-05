# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='grass'
pkgver='7.0'
pkgrel='1'
pkgdesc="GRASS GIS (7.0 release): geospatial data management and analysis, image \
processing, graphics/maps production, spatial modeling and visualization."
arch=('i686' 'x86_64')
url='http://grass.osgeo.org/'
license=('GPL')
provides=("$pkgname")

# More about GRASS build and runtime deps on http://grasswiki.osgeo.org/wiki/Compile_and_Install.
depends=('zlib' 'freetype2' 'cfitsio' 'fftw' 'gdal' 'geos' 'glu' 'libjpeg'
         'liblas' 'libpng' 'libtiff' 'libxmu' 'mesa' 'postgresql' 'proj'
         'wxpython2.8' 'wxgtk2.8' 'xorg-server' 'cairo' 'unixodbc' 'python2'
         'python2-numpy' 'python2-matplotlib' 'python2-pillow')
makedepends=('subversion' 'doxygen')
optdepends=('r: R language interface; see http://grasswiki.osgeo.org/wiki/R_statistics'
            'mariadb: mysql database interface'
            'ffmpeg: ffmpeg support'
            'lapack: required for GMATH library'
            'blas: required for GMATH library'
            'lesstif: motif support')
source=("http://grass.osgeo.org/grass70/source/grass-7.0.0.tar.gz")
md5sums=('25b00b74ddb15284ffe2eacbb8999c7d')

prepare() {
  mv "${srcdir}/grass-7.0.0" "${srcdir}/${pkgname}"
  cd "$pkgname"

  msg 'Patching source...'
  # Tweak the initial PATH so that it advertised a python2->python link as
  # python. No patching to deal with the python/python2/3 issue needed:
  ln -sf "`which python2`" "${srcdir}/${pkgname}/python"

  # INSTDIR is partly hardcoded in `configure'. Fix it, so that INST_DIR, which
  # is derived from it, is set as needed:
  sed -i "s,INSTDIR='\${prefix}'\"/grass-\${GRASS_VERSION_MAJOR}\.\${GRASS_VERSION_MINOR}\.\${GRASS_VERSION_RELEASE}\",INSTDIR='\${prefix}/${pkgname}'," configure
  # This e.g. prevents ./configure from not telling true about the "Installation directory:".

  # Custom desktop file:
  sed -i -e "s,^Name=GRASS GIS 7\$,Name=GRASS GIS 7.0 release," \
         -e "s,^Icon=grass\$,Icon=/usr/share/icons/${pkgname}-64x64.png," \
         -e "s,^Exec=grass7\$,Exec=${pkgname}," \
         "${srcdir}/${pkgname}/gui/icons/grass.desktop"
}

build() {
  cd "$pkgname"
  msg 'Configuring build...'
  PATH="${srcdir}/${pkgname}:$PATH"
  export PATH
  # Enabling only those features which are not enabled by default. Out of the
  # usefull ones, only DWG, MySQL, FFMPEG and Motif are left disabled. LAPACK
  # and BLAS are not used for anything in GRASS anyway:

  # GRASS build dystem can't cope with current Arch's /etc/makepkg.conf default CPPFLAGS="-D_FORTIFY_SOURCE=2".
  # At configure it throws:
  #
  # checking for curses.h... no
  # configure: error: *** Unable to locate curses includes.
  #
  # Due to (in config.log):
  #
  # In file included from /usr/include/assert.h:36:0,
  #                  from configure:1527:
  # /usr/include/features.h:330:4: warning: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wcpp]
  # #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
  #    ^

  # I don't have any better idea than removing any -D_FORTIFY_SOURCE occurences from CPPFLAGS:
  CPPFLAGS=`echo $CPPFLAGS | sed 's/-D_FORTIFY_SOURCE=.//g'` CFLAGS="$CFLAGS -Wall" CXXFLAGS="$CXXFLAGS -Wall" ./configure \
    --prefix=/opt \
    --exec-prefix="/opt/$pkgname" \
    --with-cxx \
    --with-cairo \
    --with-freetype \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-geos \
    --with-liblas \
    --with-nls \
    --with-netcdf \
    --with-odbc \
    --with-openmp \
    --with-postgres \
    --with-python=/usr/bin/python2-config \
    --with-readline \
    --with-proj-includes=/usr/include \
    --with-proj-libs=/usr/lib \
    --with-proj-share=/usr/share/proj \
    --with-pthread \
    --with-sqlite \
    --with-wxwidgets=/usr/bin/wx-config-2.8

  # According to GRASS dev team, --enable-64bit has effect only on AIX, HP-UX,
  # IRIX and Solaris. It's *always* enabled on GNU/Linux if the build platform
  # supports it, no matter what "64bit support:" on the configure output reads,
  # so there's no need to set it explicitely on Arch.
  
  # To provide a usefull stacktrace:
  #
  # CFLAGS="-O0 -ggdb -Wall -Werror-implicit-function-declaration -fexceptions"
  # CXXFLAGS="-O0 -ggdb -Wall -Werror-implicit-function-declaration -fexceptions"
  # options=(!strip)
  # Not sure if -Werror-implicit-function-declaration -fexceptions should really go to CXXFLAGS.
  # Let me know if you know.

  msg 'Building...'
  make
  # That used to be `make PYTHON=python2'
}

package() {
  cd "$pkgname"
  # Install GRASS in $pkgir of makepkg's fakeroot env:
  make prefix="${pkgdir}/opt" exec_prefix="${pkgdir}/opt/${pkgname}" INST_DIR="${pkgdir}/opt/${pkgname}" install

  msg 'Patching the build results...'
  # During `make install' several files get a content based on `INST_DIR' and
  # `UNIX_BIN' make vars. I don't know how to avoid this without changing
  # GRASS build system. Doing some post-install tweaks then:
  sed -i "s,${pkgdir},,g" "${pkgdir}/opt/${pkgname}/include/Make/Platform.make" \
                          "${pkgdir}/opt/${pkgname}/include/Make/Grass.make" \
                          "${pkgdir}/opt/${pkgname}/etc/fontcap" \
                          "${pkgdir}/opt/${pkgname}/bin/grass70" \
                          "${pkgdir}/opt/${pkgname}/demolocation/.grassrc70"

  # Link GRASS exec script in /usr/bin under a custom name.
  # This allows e.g. grass70 and grass70-svn be co-installed:
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/bin/grass70" "${pkgdir}/usr/bin/grass"

  # Instead of patching GRASS Python scripts to use `python2' and messing with
  # GRASS_PYTHON, link to a correct interpreter from $GISBASE:
  ln -sf "`which python2`" "${pkgdir}/opt/${pkgname}/bin/python"

  # The startup Python 2 script needs a patch nevertheless:
  sed -i '1 s/python/python2/' "${pkgdir}/opt/${pkgname}/bin/grass70"

  # Install an ldconfig conf for GRASS libs in /opt to be visible on the
  # system. Arch runs `ldconfig' after install automatically:
  echo "/opt/${pkgname}/lib" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

  # Desktop integration:
  install -D -m644 "${srcdir}/${pkgname}/gui/icons/grass-64x64.png" "${pkgdir}/usr/share/icons/${pkgname}-64x64.png"
  install -D -m644 "${srcdir}/${pkgname}/gui/icons/grass.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
