# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=r
pkgver=3.5.2
pkgrel=1
pkgdesc='Language and environment for statistical computing and graphics'
arch=('x86_64')
license=('GPL')
url='https://www.r-project.org/'
depends=(
    'blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff' 'ncurses' 'pcre'
    'readline' 'zlib' 'perl' 'gcc-libs' 'libxt' 'libxmu' 'pango' 'xz' 'zip'
    'unzip' 'curl' 'icu'
)
makedepends=('jdk-openjdk' 'gcc-fortran' 'tk')
optdepends=(
    'tk: tcl/tk interface'
    'texlive-bin: latex sty files'
    'gcc-fortran: needed to compile some CRAN packages'
    'openblas: faster linear algebra'
)
backup=(
    'etc/R/Makeconf'
    'etc/R/Renviron'
    'etc/R/ldpaths'
    'etc/R/repositories'
    'etc/R/javaconf'
)
options=('!makeflags' '!emptydirs')
source=(
    "https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz"
    'r.desktop'
    'r.png'
    'R.conf'
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

# Avoid the following linking issue:
# src.: https://bbs.archlinux.org/viewtopic.php?pid=1953816#p1953816
# src.: https://github.com/radfordneal/pqR/issues/41#issuecomment-649139014
# ---
# /usr/bin/ld: ../unix/sys-unix.o:(.bss+0x0): multiple definition of `ptr_R_ProcessEvents'; ../unix/system.o:(.bss+0x20): first defined here
export CFLAGS+=' -fcommon'
# Disable a check in the Fortran compiler as a call to a R function has
# inverted arguments
# src.: https://github.com/radfordneal/pqR/issues/41#issuecomment-649139014
# ---
#
#    91 |         call dqrsl(x, ldx, n, k, qraux, sigma, sigma, dummy,
#       |                                               2
# ......
#   111 |                call dqrsl(x, ldx, n, k, qraux, sigma, dummy, sigma,
#       |                                                      1
# Error: Rank mismatch between actual argument at (1) and actual argument at (2) (rank-1 and scalar)
# make[5]: *** [../../../../etc/Makeconf:185: lminfl.o] Error 1
export FFLAGS+=' -fallow-argument-mismatch'

prepare() {
    cd R-${pkgver}
    # set texmf dir correctly in makefile
    sed -i 's|$(rsharedir)/texmf|${datarootdir}/texmf|' share/Makefile.in
}

build() {
    cd R-${pkgver}
    ./configure \
        --prefix=/usr \
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
