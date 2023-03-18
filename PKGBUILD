# Maintainer: nytpu <alex at nytpu dot com>
# Send patches or reports to the mailing list linked at:
# https://git.sr.ht/~nytpu/PKGBUILDs/

pkgname=spark2014-git
pkgver=0.3.draft.r23092.g3e6f33a5e9
pkgrel=1
pkgdesc='Formally defined programming language based on Ada (GNAT FSF version)'
url='https://www.spark-2014.org'
arch=('x86_64')
license=('GPL')

options=('!makeflags')

depends=('python')
makedepends=('git' 'gprbuild' 'coq' 'gnatcoll-core' 'gprbuild' 'ocaml-num'
             'ocaml-menhir' 'ocaml-ocamlgraph' 'ocaml-zarith' 'ocaml-camlzip'
             'ocaml-ocplib-simplex-git' 'ocaml-yojson' 'python-sphinx'
             'python-sphinx_rtd_theme')
optdepends=('alt-ergo: alternative prover'
            'z3: alternative prover'
            'cvc4: alternative prover')

provides=('spark2014')
conflicts=('spark2014')

# I could potentially use github's svn support to checkout only the gcc/ada
# directory instead of cloning the entire gcc tree.  The downside to this is
# that github will take awhile to generate the checkout.
# svn+https://github.com/gcc-mirror/gcc/trunk/gcc/ada
source=('git+https://github.com/AdaCore/spark2014#branch=fsf'
        'why3-adacore::git+https://github.com/AdaCore/why3'
        'git+https://github.com/gcc-mirror/gcc'
        'makefile-fixes.patch'
        'build-flags.patch')


sha256sums=('SKIP' 'SKIP' 'SKIP'
            '4ba7b439be23cde5612f743fd552774f43312fdfacd64fb0c98b9b6a9f78f6b2'
            '55d433193028ffce792e622eb54d9f206c441e1bdecb9492ccfef04843e62142')

prepare() {
    cd spark2014
    git submodule init
    git config submodule.why3.url "${srcdir}/why3-adacore"
    git -c protocol.file.allow=always submodule update why3
    cd why3 && git reset --hard && cd ..

    ln -sf "${srcdir}/gcc/gcc/ada" gnat2why/gnat_src

    # Use install instead of mv to install the various targets while also
    # houring the INSTALLDIR convention used within this Makefile.
    patch -Np2 -i "${srcdir}/makefile-fixes.patch"
    patch -Np2 -i "${srcdir}/build-flags.patch"

    # Arch Linux doesn't use libexec, everything lives under lib.
    sed -i 's/libexec/lib/g' src/gnatprove/configuration.ads
    sed -i 's/libexec/lib/g' share/spark/unix/doinstall
}

pkgver() {
    cd spark2014
    git describe --long --tags | sed 's/_/-/; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd spark2014

    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup INSTALLDIR="${pkgdir}/usr"
    make
    make -C docs/lrm man
    make -C docs/ug man
}

package() {
    cd spark2014
    make INSTALLDIR="${pkgdir}/usr" install-all install-examples

    cd gnat2why
    gprinstall -r --mode=usage -p -Pgnat2why --prefix="${pkgdir}/usr"
    cd ..

    gprinstall -r --mode=usage -p -Pgnatprove --prefix="${pkgdir}/usr"

    rm -f -- "${pkgdir}/usr/bin/target.atp"

    install -Dm0644 docs/lrm/_build/man/spark2014refman.1 "${pkgdir}/usr/share/man/man7/spark2014_reference.7"
    install -Dm0644 docs/ug/_build/man/spark2014usersguide.1 "${pkgdir}/usr/share/man/man7/spark2014_userguide.7"
}
