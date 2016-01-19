# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgbase=revolution-r-open
pkgname=('revolution-r-open' 'revolution-r-open-blas')
pkgver=3.2.2
_addpkgver=-hotfix_01
pkgrel=2
pkgdesc="Language and environment for statistical computing and graphics, modified version by Revolution Analytics"
arch=('x86_64')
license=('GPL')
url=('http://www.revolutionanalytics.com/revolution-r-open')
makedepends=('jdk7-openjdk' 'gcc-fortran' 'tk')
options=('!makeflags' '!emptydirs')
source=("https://github.com/RevolutionAnalytics/RRO/archive/RRO-${pkgver}${_addpkgver}.tar.gz"
	"Rprofile_site.patch"
	"rro.desktop")
md5sums=('5a6f399a018e6037bc6776847442d6a9'
         '9e826ad5231ca3960f5fdb5ec45231ff'
         '92f8626c1f4d8603058d24fce995f02a')
sha512sums=('f271dcdf993968bd980c854293b692d1fd3cc89d830cfd8f633472c2547836d935d5bc0fc6f147344ba645bea9c4f9e47a9ef5c2b90f54ac9c55b9ee950d598e'
            'd65cf56129f55e9cc0bd5f1a037d550f9c645d4d2ad9646002d316b05da6ebc31e372ef1da511ee727e229cab4d99659ea1644ade0318e315cc7d65d627267fd'
            'dd37fa3e65d46bbd8e085af353aa5f9cb2f2cabae8b6210b3db2c41e1707c3ac544d9928dd610d7b185b2657180c4dec7afe59a3b2888f507c2a1eba36b0c5ea')

prepare() {
# Patch Rprofile.site for Arch Linux
  patch "RRO-RRO-${pkgver}${_addpkgver}/RRO-src/files/common/Rprofile.site" "Rprofile_site.patch"
}

build() {
# Build R
  cd "RRO-RRO-${pkgver}${_addpkgver}/R-src"
  ./configure 	--prefix="/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}" \
		--enable-R-shlib \
		--with-tcltk \
		--with-cairo \
		--with-libpng \
		--with-libtiff \
		--with-x=yes \
		--with-lapack \
		--enable-BLAS-shlib \
		LIBR="-lpthread" \
		--enable-memory-profiling
  make

# Add default Revolution R Open packages
  echo 'install.packages("checkpoint",repos="http://mran.revolutionanalytics.com/snapshot/2015-05-01")' | bin/R -q --vanilla
}

package_revolution-r-open() {
  install=revolution-r-open.install
  provides=("r=${pkgver}${_addpkgver}")
  conflicts=('r')
  backup=("usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/Makeconf" "usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/Renviron" "usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/ldpaths" "usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/repositories" "usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/javaconf" "usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc/Rprofile.site")
  depends=('revolution-r-open-blas' 'curl' 'libpng' 'libjpeg' 'libtiff' 'pango' 'libxmu' 'bzip2' 'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs' 'libxt' 'xz' 'desktop-file-utils' 'zip' 'unzip')
  optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files' 'revomath: high performance BLAS/Lapack library' 'revolution-r-open-blas-systemblas: use system BLAS&Lapack libraries')


  cd "RRO-RRO-${pkgver}${_addpkgver}/R-src"
  make DESTDIR="${pkgdir}" install
  cp ../RRO-src/files/common/Rprofile.site "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/etc"
  cp ../README.txt "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}"
  cp ../COPYING "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/bin/R"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/bin/Rscript"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/lib/libRblas.so" 
  rm "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/lib/libRlapack.so"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/bin/R" "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/bin/R"
  ln -s "/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/bin/R" "${pkgdir}/usr/bin/R"
  ln -s "/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/bin/Rscript"
  ln -s "/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/bin/Rscript"

  install -Dm644 "${srcdir}/rro.desktop" "${pkgdir}/usr/share/applications/rro.desktop"
  install -Dm644 "${srcdir}/RRO-RRO-${pkgver}${_addpkgver}/RRO-src/OSX/project/clarkbg.png" "${pkgdir}/usr/share/pixmaps/rro.png"
}

package_revolution-r-open-blas() {
  depends=('revolution-r-open')
  pkgdesc="Unoptimized math library for Revolution R Open"
  mkdir -p "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/lib"
  cp "${srcdir}/RRO-RRO-${pkgver}${_addpkgver}/R-src/lib/libRblas.so" "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/lib/libRblas.so"
  cp "${srcdir}/RRO-RRO-${pkgver}${_addpkgver}/R-src/lib/libRlapack.so" "${pkgdir}/usr/lib/RRO-${pkgver}${_addpkgver}/R-${pkgver}${_addpkgver}/lib64/R/lib/libRlapack.so"
}
