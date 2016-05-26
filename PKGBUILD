# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgbase=microsoft-r-open
pkgname=('microsoft-r-open' 'microsoft-r-open-blas')
pkgver=3.2.5
_mrandate=2016-05-01
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics, modified version by Microsoft"
arch=('x86_64')
license=('GPL')
url='https://mran.revolutionanalytics.com/open/'
makedepends=('java-environment' 'gcc-fortran' 'tk')
options=('!makeflags' '!emptydirs')
source=("https://github.com/RevolutionAnalytics/RRO/archive/MRO-${pkgver}.tar.gz"
	"Rprofile_site.patch"
	"mro.desktop")
md5sums=('0572a3384f9bc724118cb9b7c363f885'
         '3e35bccbf4b9df66059400c4c42d21ef'
         '70e8f9d0b1eebeb1f0b45f4568bc0701')
sha512sums=('b309dba4820210728cc61520be1e48739b82350e5ae3897578e95a21742ed26ea83c4afd1c727c39417e419ef037a7d52ef554587723201b5ce349ec848d4f89'
            'f6d0dc696a1c8fd6f7714c77bf286663ca34d5b1ab0226fb26d9574ed3bf6a38a59743fb2165a9235f91d31cba3f97a7faaca6e5201e60dd9d554fddb0700168'
            '2b0221bd1e0fdd399284333e6f2020bb9ad11395ad39dd2fca688b7ebc68fbbc60de59a757e1898be8bcd9e2926afccc121043f38445e7693f177c3076f92b61')

prepare() {
# Patch Rprofile.site for Arch Linux
  patch "RRO-MRO-${pkgver}/RRO-src/files/common/Rprofile.site" "Rprofile_site.patch"
}

build() {
# Build R
  cd "RRO-MRO-${pkgver}/R-src"
  ./configure 	--prefix="/usr/lib/MRO-${pkgver}/R-${pkgver}" \
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
  echo "install.packages(\"checkpoint\", \"${srcdir}/RRO-MRO-${pkgver}/R-src/library\", repos=\"http://mran.revolutionanalytics.com/snapshot/${_mrandate}\")" | bin/R -q --vanilla
}

package_microsoft-r-open() {
  install=microsoft-r-open.install
  provides=("r=${pkgver}")
  conflicts=('r')
  backup=("usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/Makeconf" "usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/Renviron" "usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/ldpaths" "usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/repositories" "usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/javaconf" "usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc/Rprofile.site")
  depends=('microsoft-r-open-blas' 'curl' 'libpng' 'libjpeg' 'libtiff' 'pango' 'libxmu' 'bzip2' 'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs' 'libxt' 'xz' 'desktop-file-utils' 'zip' 'unzip')
  optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files' 'revomath: high performance BLAS/Lapack library' 'microsoft-r-open-blas-systemblas: use system BLAS&Lapack libraries')


  cd "RRO-MRO-${pkgver}/R-src"
  make DESTDIR="${pkgdir}" install
  cp ../RRO-src/files/common/Rprofile.site "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/etc"
  cp ../RRO-src/files/common/ThirdPartyNotices.pdf "${pkgdir}/usr/lib/MRO-${pkgver}"
  cp ../README.txt "${pkgdir}/usr/lib/MRO-${pkgver}"
  cp ../COPYING "${pkgdir}/usr/lib/MRO-${pkgver}"
  rm "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/bin/R"
  rm "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/bin/Rscript"
  rm "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so" 
  rm "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/bin/R" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/bin/R"
  ln -s "/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/bin/R" "${pkgdir}/usr/bin/R"
  ln -s "/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/bin/Rscript"
  ln -s "/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/bin/Rscript" "${pkgdir}/usr/bin/Rscript"

  install -Dm644 "${srcdir}/mro.desktop" "${pkgdir}/usr/share/applications/mro.desktop"
  install -Dm644 "${srcdir}/RRO-MRO-${pkgver}/RRO-src/OSX/project/clarkbg.png" "${pkgdir}/usr/share/pixmaps/mro.png"
}

package_microsoft-r-open-blas() {
  depends=('microsoft-r-open')
  pkgdesc="Unoptimized math library for Revolution R Open"
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}/RRO-MRO-${pkgver}/R-src/lib/libRblas.so" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so"
  cp "${srcdir}/RRO-MRO-${pkgver}/R-src/lib/libRlapack.so" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"
}
