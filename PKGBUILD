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
url='http://www.r-project.org/'
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'libxt' 'libxmu' 'pango' 'xz' 'desktop-file-utils' 'zip' 'unzip')
makedepends=('gcc-fortran' 'tk')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
backup=('etc/R-devel/Makeconf' 'etc/R-devel/Renviron' 'etc/R-devel/ldpaths' 'etc/R-devel/repositories' 'etc/R-devel/javaconf')
options=('!makeflags' '!emptydirs')
install=r.install
source=("https://stat.ethz.ch/R/daily/R-devel.tar.bz2"
	'r.desktop'
	'r.png'
	'R.conf')
sha1sums=('SKIP'
          'f5a9e7f53d1a45a5be4e61bad0f2727ea35d6b92'
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
   ./configure  --prefix=/opt/r-devel \
		--libdir=/opt/r-devel/lib \
		--sysconfdir=/etc/R-devel \
		--datarootdir=/opt/r-devel/share \
		  rsharedir=/opt/r-devel/share/R/ \
		  rincludedir=/opt/r-devel/include/R/ \
		  rdocdir=/opt/r-devel/share/doc/R/ \
                --with-x \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   make  -j`nproc`

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
   sed -i "s|${pkgdir} ||" "${pkgdir}/opt/r-devel/bin/R"
   # rm "${pkgdir}/opt/r-devel/lib/R/bin/R"
   cd "${pkgdir}/opt/r-devel/lib/R/bin"

   #ln -s ../../../local/bin/R-devel
   #rename bin
   mv "${pkgdir}/opt/r-devel/bin/R" "${pkgdir}/opt/r-devel/bin/R-devel"
   mv "${pkgdir}/opt/r-devel/bin/Rscript" "${pkgdir}/opt/r-devel/bin/Rscript-devel"
   mkdir -p "${pkgdir}/usr/bin/"
   ln -s /opt/r-devel/bin/R-devel "${pkgdir}/usr/bin/R-devel"
   ln -s /opt/r-devel/bin/Rscript-devel "${pkgdir}/usr/bin/Rscript-devel"

  # install some freedesktop.org compatibility
  install -Dm644 "${srcdir}/r.desktop" \
	"${pkgdir}/usr/share/applications/r-devel.desktop"
  install -Dm644 "${srcdir}/r.png" \
	"${pkgdir}/usr/share/pixmaps/r-devel.png"

  # move the config directory to /etc and create symlinks
  install -d "${pkgdir}/etc/R-devel"
  cd "${pkgdir}/opt/r-devel/lib/R/etc"
  for i in *; do
    mv -f ${i} "${pkgdir}/etc/R-devel"
    ln -s /etc/R-devel/${i} ${i}
  done

  # Install ld.so.conf.d file to ensure other applications access the shared lib
  install -Dm644 "${srcdir}/R.conf" "${pkgdir}/etc/ld.so.conf.d/R-devel.conf"
}
