# Maintainer: halfhorn <mwellsa -at- gmail -dot- com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Based on the PKGBUILD for R

pkgname=r-mkl
pkgver=3.2.1
pkgrel=1
pkgdesc="Language and environment for statistical computing and graphics, set up to use Intel's MKL"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
#provides=('r=3.1.2')
provides=("r=${pkgver}","r-mkl=${pkgver}")
conflicts=('r')
depends=('intel-mkl' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'libxt' 'libxmu' 'pango' 'xz' 'desktop-file-utils' 'zip' 'unzip')
makedepends=('jdk8-openjdk' 'gcc-fortran' 'tk')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files'
            'icc: intel compiler' 'icpc: intel compiler' 'xiar: intel compiler'
            'xild: intel compiler')
backup=('etc/R/Makeconf' 'etc/R/Renviron' 'etc/R/ldpaths' 'etc/R/repositories' 'etc/R/javaconf')
options=('!makeflags' '!emptydirs')
install=r-mkl.install

source=("http://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz"
	'r.desktop'
	'r.png'
	'R.conf')

md5sums=('c2aac8b40f84e08e7f8c9068de9239a3'
         '44ca875140b148543148b7749c7d6f5e'
         '00659f39e90627fe87f1645df5d4e3a7'
         '1dfa62c812aed9642f6e4ac34999b9fe')
sha512sums=('8ae44a8edc5e41e271c5a7b9da7058dba354172e237d56345810e140524b96442d1dea8988956adb89106cbd42ca7ea1eb2159651e28a81b3a45fc98b8e62f86'
            '1a90aed5411d72dd3e7708db0cb92c518e656e1a510ece02ad934131e05b8e683b4a36da8d37198263dc19fb2f3f19656c19c01f9b67974f0d7755974076d0b7'
            '55ed6e819dcbb231d842d825134b84d1a24db177558d5dad9369d57fd21d0239d6433c4311531171a101ca3c7c0685493e9cc6c1fe9e4e0df59f2331cff150ba'
            'aae388c5b6c02d9fb857914032b0cd7d68a9f21e30c39ba11f5a29aaf1d742545482054b57ce18872eabb6605bbb359b2fc1e9be5ce6881443fdbdf6b67fab3b')

if [ "$CARCH" == "x86_64" ]; then
    _intel_arch=intel64
    _intel_lib=mkl_gf_lp64
elif [ "$CARCH" == "i686" ]; then
    _intel_arch=ia32
    _intel_lib=mkl_gf
fi

#_CC="icc" # uncomment to build with the Intel compiler

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
    # Set up the environment for MKL
    source /opt/intel/mkl/bin/mklvars.sh ${_intel_arch}
    _icclibpath=$(echo $MKLROOT | sed "s%mkl%compiler%g")/lib/${_intel_arch}
    _mkllibpath=$MKLROOT/lib/${_intel_arch}
    _mkllibs=" -fopenmp -Wl,--no-as-needed -L${_mkllibpath} -l${_intel_lib} -lmkl_core -lmkl_gnu_thread -ldl -lpthread -lm"
    LDFLAGS="${LDFLAGS} -L${_icclibpath}"
    
    
    if [ $_CC = "icc" ]; then
        export CC="icc"
        export CXX="icpc"
        export AR="xiar"
        export LD="xild"
        export _F77="ifort"
        export _FC="ifort"
    else
        export _F77="gfortran"
        export _FC="gfortran"
    fi
    
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
     	--with-blas="${_mkllibs}" \
     	--with-lapack \
     	F77=${_F77} \
     	FC=${_FC} \
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
