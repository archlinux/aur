# Maintainer: William Gathoye <william + aur [at] gathoye [dot] be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=r352
pkgver=3.5.2
pkgrel=2
pkgdesc='Language and environment for statistical computing and graphicsi (version 3.5.2)'
arch=('x86_64')
license=('GPL')
url='https://www.r-project.org/'
# The package providing the dependency will need to specify the version in its
# 'provides' array. It's not enough that the version of the package contains
# that information - since 'provides' are abstract features that do not
# necessarily map to packages neatly, the version provided must be specified
# there as well.
# src.: https://www.reddit.com/r/archlinux/comments/ebj3vo/x/fb61u92
provides=('r=3.5.2')
conflicts=('r')
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
    '53e94f01ecee6c90cecfa07ee9950d62130a331010c0b23baaf88ab5009007856c9352ce97916404ff35d19632495902d41cb655a5fd116a7d2f5d6767d7b447'
    '658793de80f905f790ef3f8205ce4d78c69eb27eafaf6579056743df7af921824ce2e07561a5c14706a9d6520bbbde0c0ee70c10eccf2d11f7626b00c567562d'
    '55ed6e819dcbb231d842d825134b84d1a24db177558d5dad9369d57fd21d0239d6433c4311531171a101ca3c7c0685493e9cc6c1fe9e4e0df59f2331cff150ba'
    'aae388c5b6c02d9fb857914032b0cd7d68a9f21e30c39ba11f5a29aaf1d742545482054b57ce18872eabb6605bbb359b2fc1e9be5ce6881443fdbdf6b67fab3b'
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

# Testing the package:
# mkdir ./chroot
# CHROOT=./chroot
# mkarchroot $CHROOT/root base-devel
# makechrootpkg -c -r $CHROOT
# src.: https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot

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
