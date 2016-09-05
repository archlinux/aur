# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='grass6'
pkgver='6.4.6'
pkgrel='1'
pkgdesc="Geospatial data management and analysis, image processing, graphics/maps production, spatial modeling and visualization."
arch=('i686' 'x86_64')
url='https://grass.osgeo.org'
license=('GPL')

# More about GRASS build and runtime deps on http://grasswiki.osgeo.org/wiki/Compile_and_Install.
depends=('zlib' 'freetype2' 'cfitsio' 'fftw' 'gdal' 'geos' 'glu' 'libjpeg'
         'libpng' 'libtiff' 'libxmu' 'mesa' 'postgresql' 'proj' 'tcl' 'tk'
         'wxpython' 'xorg-server' 'cairo' 'unixodbc' 'bc' 'xml2' 'python2'
	 'python2-numpy' 'python2-matplotlib' 'python2-pillow'
         'subversion')
makedepends=('doxygen')
optdepends=('r: R language interface. See http://grasswiki.osgeo.org/wiki/R_statistics.')
source=("https://grass.osgeo.org/grass64/source/grass-${pkgver}.tar.gz")
md5sums=('c92c36b7a024b464a207ae4dcd4670a6')

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

  # GRASS build system can't cope with current Arch's /etc/makepkg.conf default
  # CPPFLAGS="-D_FORTIFY_SOURCE=2".
  #
  # I have reported it in GRASS bugtracker: https://trac.osgeo.org/grass/ticket/2916.
  #
  # Using a workaround as follows:

  FORTIFY_FLAGS=`echo "$CPPFLAGS" | sed '/^.*\(-D_FORTIFY_SOURCE=.\).*$/s//\1/'` CPPFLAGS=`echo "$CPPFLAGS" | sed 's/-D_FORTIFY_SOURCE=.//g'` CFLAGS="$FORTIFY_FLAGS $CFLAGS" CXXFLAGS="$FORTIFY_FLAGS $CXXFLAGS" ./configure \
    --prefix=/opt \
    --exec_prefix=/opt/$pkgname \
    --with-cxx \
    --with-cairo \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-geos \
    --with-nls \
    --with-odbc \
    --with-postgres \
    --with-python=/usr/bin/python2-config \
    --with-readline \
    --with-sqlite

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
  # This allows e.g. grass64 and grass64-svn be easily co-installed.
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
