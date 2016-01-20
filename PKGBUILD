# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgbase=microsoft-r-open
pkgname=('microsoft-r-open' 'microsoft-r-open-blas')
pkgver=3.2.3
_localver=323
_mrandate=2016-01-01
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics, modified version by Microsoft"
arch=('x86_64')
license=('GPL')
url=('https://mran.revolutionanalytics.com/open/')
makedepends=('java-environment' 'gcc-fortran' 'tk')
options=('!makeflags' '!emptydirs')
source=("https://github.com/RevolutionAnalytics/RRO/archive/MRO-${pkgver}.tar.gz"
	"Rprofile_site.patch"
	"mro.desktop")
md5sums=('59e258fc68e3072eee71e9b12f4588b4'
         'ce7665e3d5a29ca1712056a30b7da09e'
         '70e8f9d0b1eebeb1f0b45f4568bc0701')
sha512sums=('33ebce1d50d44e941a018240f888982f5b0985ba968249b324d977546413b43604994ed94b4dc64e5cc563ec5233cebec53e5cbf4f9f83bd07b5f409ad15f76e'
            '5888f734fa8226384195ff0e892a70dfe24ba7ef594ab76383c5875a5d754f7be02f03daf870fc3eac492de65009183de65dbd0c61dfbae1e84c90642b64dfca'
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
