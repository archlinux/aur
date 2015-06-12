# $Id: PKGBUILD 218371 2014-07-30 10:32:55Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=r-devel
pkgver=latest
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'libxt' 'libxmu' 'pango' 'xz' 'desktop-file-utils' 'zip' 'unzip')
makedepends=('gcc-fortran' 'tk')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
backup=('etc/R-devel/Makeconf' 'etc/R-devel/Renviron' 'etc/R-devel/ldpaths' 'etc/R-devel/repositories' 'etc/R-devel/javaconf')
options=('!makeflags' '!emptydirs')
install=r.install
source=("ftp://ftp.stat.math.ethz.ch/Software/R/R-devel.tar.gz"
	'r.desktop'
	'r.png'
	'R.conf')
sha1sums=('SKIP'
          'd7fa521345b230a4187d60d07d06ce4b6d573e3f'
          'a69a07ec363440efc18ce0a7f2af103375dea978'
          'a2a2d672b4b123d8305666444680cb4f6909261b')

prepare() {
   cd R-devel
   # set texmf dir correctly in makefile
   sed -i 's|$(rsharedir)/texmf|${datarootdir}/texmf|' share/Makefile.in
   # fix for texinfo 5.X
   sed -i 's|test ${makeinfo_version_min} -lt 7|test ${makeinfo_version_min} -lt 0|' configure
}

build() {
   cd R-devel
   ./configure  --prefix=/usr/local \
		--libdir=/usr/local/lib \
		--sysconfdir=/etc/R-devel \
		--datarootdir=/usr/local/share \
		  rsharedir=/usr/local/share/R/ \
		  rincludedir=/usr/local/include/R/ \
		  rdocdir=/usr/local/share/doc/R/ \
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
   cd R-devel
   make DESTDIR="${pkgdir}" install

# install libRmath.so
   cd src/nmath/standalone
   make DESTDIR="${pkgdir}" install

   #  Fixup R wrapper scripts.
   sed -i "s|${pkgdir} ||" "${pkgdir}/usr/local/bin/R"
   # rm "${pkgdir}/usr/local/lib/R/bin/R"
   cd "${pkgdir}/usr/local/lib/R/bin"
   
   #ln -s ../../../local/bin/R-devel
   #rename bin
   mv "${pkgdir}/usr/local/bin/R" "${pkgdir}/usr/local/bin/R-devel" 
   mv "${pkgdir}/usr/local/bin/Rscript" "${pkgdir}/usr/local/bin/Rscript-devel" 
   
  # install some freedesktop.org compatibility
  install -Dm644 "${srcdir}/r.desktop" \
	"${pkgdir}/usr/local/share/applications/r.desktop"
  install -Dm644 "${srcdir}/r.png" \
	"${pkgdir}/usr/local/share/pixmaps/r.png"

  # move the config directory to /etc and create symlinks
  install -d "${pkgdir}/etc/R-devel"
  cd "${pkgdir}/usr/local/lib/R/etc"
  for i in *; do
    mv -f ${i} "${pkgdir}/etc/R-devel"
    ln -s /etc/R/${i} ${i}
  done

  # Install ld.so.conf.d file to ensure other applications access the shared lib
  install -Dm644 "${srcdir}/R.conf" "${pkgdir}/etc/ld.so.conf.d/R-devel.conf"
}
