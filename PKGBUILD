# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=r
pkgver=3.5.1
pkgrel=3
pkgdesc="Language and environment for statistical computing and graphics"
arch=('x86_64')
license=('GPL')
url='https://www.r-project.org/'
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'libxt' 'libxmu' 'pango' 'xz' 'zip' 'unzip' 'curl' 'icu')
makedepends=('jdk7-openjdk' 'gcc-fortran' 'tk')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files' 'gcc-fortran: needed to compile some CRAN packages'
            'openblas: faster linear algebra')
backup=('etc/R/Makeconf' 'etc/R/Renviron' 'etc/R/ldpaths' 'etc/R/repositories' 'etc/R/javaconf')
options=('!makeflags' '!emptydirs')
source=("https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz"
	'r.desktop'
	'r.png'
	'R.conf')
sha1sums=('9314d3d372b05546a33791fbc8dd579c92ebd16b'
          'dd214eee232b7aced7366722ad416b6b39be8e1b'
          'a69a07ec363440efc18ce0a7f2af103375dea978'
          '43668da6cfd1b4455a99f23e79e2059294dddac9')

prepare() {
   cd R-${pkgver}
   # set texmf dir correctly in makefile
   sed -i 's|$(rsharedir)/texmf|${datarootdir}/texmf|' share/Makefile.in
}

build() {
   cd R-${pkgver}
   ./configure  --prefix=/usr \
		--libdir=/usr/lib \
		--sysconfdir=/etc/R \
		--datarootdir=/usr/share \
		  rsharedir=/usr/share/R/ \
		  rincludedir=/usr/include/R/ \
		  rdocdir=/usr/share/doc/R/ \
                --with-x \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   make

# make libRmath.so
   cd src/nmath/standalone
   make shared
}

package() {
   cd R-${pkgver}
   make DESTDIR="${pkgdir}" install

# install libRmath.so
   cd src/nmath/standalone
   make DESTDIR="${pkgdir}" install

   #  Fixup R wrapper scripts.
   sed -i "s|${pkgdir} ||" "${pkgdir}/usr/bin/R"
   rm "${pkgdir}/usr/lib/R/bin/R"
   cd "${pkgdir}/usr/lib/R/bin"
   ln -s ../../../bin/R

  # install some freedesktop.org compatibility
  install -Dm644 "${srcdir}/r.desktop" \
	"${pkgdir}/usr/share/applications/r.desktop"
  install -Dm644 "${srcdir}/r.png" \
	"${pkgdir}/usr/share/pixmaps/r.png"

  # move the config directory to /etc and create symlinks
  install -d "${pkgdir}/etc/R"
  cd "${pkgdir}/usr/lib/R/etc"
  for i in *; do
    mv -f ${i} "${pkgdir}/etc/R"
    ln -s /etc/R/${i} ${i}
  done

  # Install ld.so.conf.d file to ensure other applications access the shared lib
  install -Dm644 "${srcdir}/R.conf" "${pkgdir}/etc/ld.so.conf.d/R.conf"
}
