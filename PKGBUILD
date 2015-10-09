# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='grass6'
pkgver='6.4.5'
pkgrel='3'
pkgdesc="GRASS GIS ${pkgver}: geospatial data management and analysis, image \
processing, graphics/maps production, spatial modeling and visualization."
arch=('i686' 'x86_64')
url='https://grass.osgeo.org'
license=('GPL')
provides=("$pkgname")

# More about GRASS build and runtime deps on http://grasswiki.osgeo.org/wiki/Compile_and_Install.
depends=('zlib' 'freetype2' 'cfitsio' 'fftw' 'gdal' 'geos' 'glu' 'libjpeg'
         'libpng' 'libtiff' 'libxmu' 'mesa' 'postgresql' 'proj' 'tcl' 'tk'
         'wxpython2.8' 'wxgtk2.8' 'xorg-server' 'cairo' 'unixodbc' 'bc' 'xml2'
         'python2' 'python2-numpy' 'python2-matplotlib' 'python2-pillow'
         'subversion')

makedepends=('doxygen')

optdepends=('r: R language interface; see http://grasswiki.osgeo.org/wiki/R_statistics'
            'mariadb: MySQL database interface'
            'ffmpeg: ffmpeg support'
            'lapack: required for GMATH library'
            'blas: required for GMATH library'
            'lesstif: Motif support')

source=("https://grass.osgeo.org/grass64/source/grass-${pkgver}.tar.gz")
md5sums=('c58ab8db635ebd06cfd93dce7b70b6cb')

prepare() {

  cd "${srcdir}/grass-${pkgver}"
  msg 'Patching source...'

  # Link python2 as python in the source directory, for build time.
  # "make PYTHON=`which python2`" should normally suffice, but it doesn't for
  # lib/python/ctypes.
  ln -sf "`which python2`" "${srcdir}/grass-${pkgver}/python"

  # INSTDIR is partly hardcoded in `configure'. Let's fix it, so that INST_DIR,
  # which is derived from it, is set as needed. Debian packagers are doing a
  # similar thing (see eg. https://anonscm.debian.org/cgit/pkg-grass/grass.git/tree/debian/patches/instdir).
  sed -i "s,INSTDIR='\${prefix}'\"/grass-\${GRASS_VERSION_MAJOR}\.\${GRASS_VERSION_MINOR}\.\${GRASS_VERSION_RELEASE}\",INSTDIR='\${prefix}/${pkgname}'," configure

  # Custom desktop file:
  sed -i -e "s,^Name=GRASS GIS 6\$,Name=GRASS GIS ${pkgver}," \
         -e "s,^Exec=grass64\$,Exec=${pkgname}," \
         -e "s,^Icon=grass\$,Icon=/usr/share/icons/${pkgname}-64x64.png," \
         "${srcdir}/grass-${pkgver}/gui/icons/grass.desktop"
}

build() {

  cd "${srcdir}/grass-${pkgver}"
  msg 'Configuring build...'

  # Tweak PATH for build time so that it advertised a python2->python link as
  # python. No patching to deal with the python/python2/3 issue needed.
  # "make PYTHON=`which python2`" should normally suffice, but it doesn't for
  # lib/python/ctypes.
  PATH="${srcdir}/grass-${pkgver}:$PATH"
  export PATH

  # Enabling only those features which are not enabled by default. Out of the
  # usefull ones, only DWG, MySQL, FFMPEG and Motif are left disabled. LAPACK
  # and BLAS are not used for anything in GRASS anyway.

  # GRASS build dystem can't cope with current Arch's /etc/makepkg.conf default
  # CPPFLAGS="-D_FORTIFY_SOURCE=2".
  #
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
  #
  # I don't have a better idea than removing any -D_FORTIFY_SOURCE occurences
  # from CPPFLAGS.

  CPPFLAGS=`echo $CPPFLAGS | sed 's/-D_FORTIFY_SOURCE=.//g'` CFLAGS="$CFLAGS -Wall" CXXFLAGS="$CXXFLAGS -Wall" ./configure \
    --prefix=/opt \
    --exec_prefix=/opt/$pkgname \
    --with-cxx \
    --with-cairo \
    --with-freetype \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-geos \
    --with-nls \
    --with-odbc \
    --with-postgres \
    --with-python=/usr/bin/python2-config \
    --with-readline \
    --with-proj-includes=/usr/include \
    --with-proj-libs=/usr/lib \
    --with-proj-share=/usr/share/proj \
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
  #
  # Not sure if -Werror-implicit-function-declaration -fexceptions should really
  # go to CXXFLAGS. Let me know if you know.

  msg 'Building...'
  make PYTHON="`which python2`"
}

package() {

  cd "${srcdir}/grass-${pkgver}"

  # Install GRASS in $pkgir of makepkg's fakeroot env:
  make prefix="${pkgdir}/opt" exec_prefix="${pkgdir}/opt/${pkgname}" install

  msg 'Patching the build results...'
  # During `make install' several files get a content based on `INST_DIR' and
  # `UNIX_BIN' make vars. I don't know how to avoid this. Some post-install
  # tweaks are needed.
  sed -i "s,${pkgdir},,g" "${pkgdir}/opt/${pkgname}/include/Make/Platform.make" \
                          "${pkgdir}/opt/${pkgname}/include/Make/Grass.make" \
                          "${pkgdir}/opt/${pkgname}/etc/fontcap" \
                          "${pkgdir}/opt/${pkgname}/bin/grass64"

  # Link GRASS exec script and gem binary in /usr/bin under a custom name.
  # This allows e.g. grass6 and grass6-svn be co-installed:
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/bin/grass64" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/opt/${pkgname}/bin/gem64" "${pkgdir}/usr/bin/gem6"

  # https://grasswiki.osgeo.org/wiki/GRASS_and_Python#Using_a_version_of_Python_different_from_the_default_installation:
  # - "On Unix, GRASS_PYTHON is only used for components which use wxPython"
  # - "Scripts rely upon the "#!/usr/bin/env python" line"
  # - "You can control the interpreter used by scripts by creating a directory
  #   containing a symlink named "python" (...) and placing that directory at the
  #   front of $PATH."
  #
  # GRASS_PYTHON is `python' by default.
  #
  # So let's link to a correct interpreter from $GISBASE/bin, which is normally
  # already in PATH in a GRASS session. That's better than patching GRASS Python
  # scripts to use `python2' and tweaking the GRASS_PYTHON var; Python add-ons
  # will be happy too.

  ln -sf "`which python2`" "${pkgdir}/opt/${pkgname}/bin/python"

  # Install dynamic linker run-time bindings conf for GRASS libs.
  # Pacman triggers `ldconfig' automatically after package installation.
  echo "/opt/${pkgname}/lib" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

  # Desktop integration.
  install -D -m644 "${srcdir}/grass-${pkgver}/gui/icons/grass-64x64.png" "${pkgdir}/usr/share/icons/${pkgname}-64x64.png"
  install -D -m644 "${srcdir}/grass-${pkgver}/gui/icons/grass.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

