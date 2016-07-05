# Maintainer: alexanderp <alexisph -at- gmail -dot- com>
# Contributor: halfhorn <mwellsa -at- gmail -dot- com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Based on the PKGBUILD for R

pkgname=r-mkl
pkgver=3.3.1
pkgrel=2
pkgdesc="Language and environment for statistical computing and graphics, linked with Intel's MKL."
arch=('x86_64')
license=('GPL')
url='http://www.r-project.org/'
provides=("r=${pkgver}","r-mkl=${pkgver}")
conflicts=('r')
depends=('intel-mkl'
        'intel-compiler-base'
        'intel-fortran-compiler'
        'bzip2'
        'libpng'
        'libjpeg'
        'libtiff'
        'ncurses'
        'pcre'
        'readline'
        'zlib'
        'perl'
        'gcc-libs'
        'libxt'
        'libxmu'
        'pango'
        'xz'
        'desktop-file-utils'
        'zip'
        'unzip')
makedepends=('jdk8-openjdk'
            'gcc-fortran'
            'tk')
optdepends=('texlive-bin: LaTeX sty files')
backup=('etc/R/Makeconf'
        'etc/R/Renviron'
        'etc/R/ldpaths'
        'etc/R/repositories'
        'etc/R/javaconf')
options=('!makeflags' '!emptydirs')
install=r-mkl.install

source=("http://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz"
        'r.desktop'
        'r.png'
        'R.conf')

md5sums=('f50a659738b73036e2f5635adbd229c5'
         '44ca875140b148543148b7749c7d6f5e'
         '8e0c51650b8a63f110fa7b09e699e9c4'
         '1dfa62c812aed9642f6e4ac34999b9fe')
sha512sums=('d0ff85e99b9ec9cac672aa30d7d1a854778c6a610bcc5336e8c60c8c74f20856f2bfeae085af793fad646ff45cb4677d9d6dcbaa18212591f72f00a02339f4cd'
            '1a90aed5411d72dd3e7708db0cb92c518e656e1a510ece02ad934131e05b8e683b4a36da8d37198263dc19fb2f3f19656c19c01f9b67974f0d7755974076d0b7'
            '1491b01d3d14b86d26c383e00e2305858a52ddd498158c9f7f6b33026ee01f246408b1676cffea73f7783c8c4cf546285705c43c0286adbd75ad77706918b5fe'
            'aae388c5b6c02d9fb857914032b0cd7d68a9f21e30c39ba11f5a29aaf1d742545482054b57ce18872eabb6605bbb359b2fc1e9be5ce6881443fdbdf6b67fab3b')

# Build with GCC/GFortran or the Intel Compiler Suite
_CC="icc" # uncomment to build with the Intel compiler suite

prepare() {
  cd R-${pkgver}
  # set texmf dir correctly in makefile
  sed -i 's|$(rsharedir)/texmf|${datarootdir}/texmf|' share/Makefile.in
  # fix for texinfo 5.X
  sed -i 's|test ${makeinfo_version_min} -lt 7|test ${makeinfo_version_min} -lt 0|' configure
  # Fix the config script to look in Makeconf for LDFLAGS
  sed -i '/LIBS=`eval $query VAR=LIBS`/a\LDFLAGS=`eval $query VAR=LDFLAGS`' src/scripts/config
}

build() {
  cd R-${pkgver}

  # https://software.intel.com/sites/products/mkl/mkl_link_line_advisor.htm
  # Interface Layer: LP64 (R uses 32-bit integers)

  _intel_arch=intel64
  _intel_lib=mkl_intel_lp64
  _gfortran_lib=mkl_gf_lp64

  # Set up the environment for MKL
  source /opt/intel/mkl/bin/mklvars.sh ${_intel_arch}

  if [ $_CC = "icc" ]; then
    source /opt/intel/composerxe/linux/bin/compilervars.sh ${_intel_arch}
    _intel_cc_opt=" -O3 -xHost -ipo -qopenmp -parallel -m64 -fp-model precise -fp-model source -diag-disable=188 -mp1 -qopt-mem-layout-trans=3"
    export MAIN_LDFLAGS=" -qopenmp"
    export FLIBS=" -lgfortran"

    _mkllibs=" -L${MKLROOT}/lib/${_intel_arch} \
      -l${_intel_lib} \
      -lmkl_intel_thread \
      -lmkl_core \
      -liomp5 \
      -lpthread \
      -lm \
      -ldl"

    export CC="icc -std=c99"
    export CXX="icpc"
    export AR="xiar"
    export LD="xild"
    export F77="ifort"
    export FC="ifort"
    export CFLAGS="${_intel_cc_opt} -I${MKLROOT}/include"
    export CXXFLAGS="${_intel_cc_opt} -I${MKLROOT}/include"
    export FFLAGS="${_intel_cc_opt} -I${MKLROOT}/include"
    export FCFLAGS="${_intel_cc_opt} -I${MKLROOT}/include"
  else
    _gcc_opt=" -O3 -fopenmp -m64"
    export MAIN_LDFLAGS=" -fopenmp"

    _mkllibs=" -L${MKLROOT}/lib/${_intel_arch} \
      -Wl,--no-as-needed \
      -l${_gfortran_lib} \
      -lmkl_intel_thread \
      -lmkl_core \
      -liomp5 \
      -lpthread \
      -lm \
      -ldl"

    export F77="gfortran"
    export FC="gfortran"
    export CFLAGS="${_gcc_opt} -I${MKLROOT}/include"
    export CXXFLAGS="${_gcc_opt} -I${MKLROOT}/include"
    export FFLAGS="${_gcc_opt} -I${MKLROOT}/include"
    export FCFLAGS="${_gcc_opt} -I${MKLROOT}/include"
  fi

  ./configure  --prefix=/usr \
    --libdir=/usr/lib \
    --sysconfdir=/etc/R \
    --datarootdir=/usr/share \
    rsharedir=/usr/share/R/ \
    rincludedir=/usr/include/R/ \
    rdocdir=/usr/share/doc/R/ \
    --with-x \
    --with-blas="${_mkllibs}" \
    --with-lapack \
    --enable-R-shlib \
    LIBnn=lib

  # Place Intel's basic math library prior to GLIBC libm
  sed -i "s/\(^\| \)-lm\( \|$\)/\1-limf -lm\2/g" {./,etc/}Makeconf

  # Build the package
  make

  # make libRmath.so
  cd src/nmath/standalone
  make shared
}

check() {
  cd R-${pkgver}
  make check-recommended
}

package() {
  cd R-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install libRmath.so
  cd src/nmath/standalone
  make DESTDIR="${pkgdir}" install

  # Fixup R wrapper scripts.
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

