# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgbase=revolution-r-open
pkgname=('revolution-r-open' 'revolution-r-open-blas')
pkgver=3.2.1
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics, modified version by Revolution Analytics"
arch=('x86_64')
license=('GPL')
url=('http://www.revolutionanalytics.com/revolution-r-open')
makedepends=('jdk7-openjdk' 'gcc-fortran' 'tk')
options=('!makeflags' '!emptydirs')
source=("https://github.com/RevolutionAnalytics/RRO/archive/v3.2.1.tar.gz"
	"Rprofile_site.patch"
	"rro.desktop")
md5sums=('d5347f77c4383f1e006b124e6ddd58f4'
         '93e48dcc83e8a5b1e596bbabc71fb16f'
         '92f8626c1f4d8603058d24fce995f02a')
sha512sums=('7e3a34d71e10ffef3c93ac9a06db27ea5b29628ec775c2399ccdf81962d8a71c1f9637fa101e06409d46247b0178afe2581946cc629c3d7da5935742d3af0278'
            'c9411567ab75e4d205addb870e8aa97d7587a32c3943799989de30823f536599d18e1fb1bc61b0da6872877a4cec449f62a222838d9999c318ebec8ac0dab4f9'
            'dd37fa3e65d46bbd8e085af353aa5f9cb2f2cabae8b6210b3db2c41e1707c3ac544d9928dd610d7b185b2657180c4dec7afe59a3b2888f507c2a1eba36b0c5ea')

prepare() {
# Patch Rprofile.site for Arch Linux
  patch "RRO-${pkgver}/files/Rprofile.site" "Rprofile_site.patch"
}

build() {
# Build R
  cd "RRO-${pkgver}/R-src"
  ./configure 	--prefix="/usr/lib/RRO-${pkgver}/R-${pkgver}" \
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
  provides=("r=${pkgver}")
  conflicts=('r')
  backup=("usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/Makeconf" "usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/Renviron" "usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/ldpaths" "usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/repositories" "usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/javaconf" "usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc/Rprofile.site")
  depends=('revolution-r-open-blas' 'curl' 'libpng' 'libjpeg' 'libtiff' 'pango' 'libxmu' 'bzip2' 'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs' 'libxt' 'xz' 'desktop-file-utils' 'zip' 'unzip')
  optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files' 'revomath: high performance BLAS/Lapack library' 'revolution-r-open-blas-systemblas: use system BLAS&Lapack libraries')


  cd "RRO-${pkgver}/R-src"
  make DESTDIR="${pkgdir}" install
  cp ../files/Rprofile.site "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/etc"
  cp ../README.txt "${pkgdir}/usr/lib/RRO-${pkgver}"
  cp ../COPYING "${pkgdir}/usr/lib/RRO-${pkgver}"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/bin/R"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/bin/Rscript"
  rm "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so" 
  rm "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/bin/R" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/bin/R"
  ln -s "/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/bin/R" "${pkgdir}/usr/bin/R"
  ln -s "/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/bin/Rscript"
  ln -s "/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/bin/Rscript"

  install -Dm644 "${srcdir}/rro.desktop" "${pkgdir}/usr/share/applications/rro.desktop"
  install -Dm644 "${srcdir}/RRO-${pkgver}/OSX/project/clarkbg.png" "${pkgdir}/usr/share/pixmaps/rro.png"
}

package_revolution-r-open-blas() {
  depends=('revolution-r-open')
  pkgdesc="Unoptimized math library for Revolution R Open"
  mkdir -p "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}/RRO-${pkgver}/R-src/lib/libRblas.so" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so"
  cp "${srcdir}/RRO-${pkgver}/R-src/lib/libRlapack.so" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"
}
