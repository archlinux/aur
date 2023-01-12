# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: nytpu   <alex at nytpu dot com>

pkgname=spark2014
pkgver=12.fsf
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

_gcc_version=12.2.0

source=('git+https://github.com/AdaCore/spark2014#branch=fsf-12'
        'why3-adacore::git+https://github.com/AdaCore/why3#branch=fsf-12'
        "https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-$_gcc_version.tar.gz"
        'makefile-fixes.patch')


sha256sums=('SKIP'
            'SKIP'
            'ef29a97a0f635e7bb7d41a575129cced1800641df00803cf29f04dc407985df0'
            '9985b6864849fb0210cdf40d64b7747cac2c8371385f9790b142d402b5b7d22a')

prepare()
{
    cd spark2014

    git submodule init
    git config submodule.why3.url "${srcdir}/why3-adacore"
    git -c protocol.file.allow=always submodule update why3
    cd why3 && git reset --hard && cd ..

    ln -sf "${srcdir}/gcc-releases-gcc-$_gcc_version/gcc/ada" gnat2why/gnat_src

    # Use install instead of mv to install the various targets while also
    # honouring the INSTALLDIR convention used within this Makefile.
    #
    patch -Np2 -i "${srcdir}/makefile-fixes.patch"

    # Arch Linux doesn't use libexec, everything lives under lib.
    #
    sed -i 's/libexec/lib/g' src/gnatprove/configuration.ads
    sed -i 's/libexec/lib/g' share/spark/unix/doinstall
}


build()
{
    cd spark2014

    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup INSTALLDIR="${pkgdir}/usr"
    GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"   make
    make -C docs/lrm man
    make -C docs/ug man
}


package()
{
    cd spark2014

    make INSTALLDIR="${pkgdir}/usr" install-all install-examples

    cd gnat2why
    gprinstall -r --mode=usage -p -Pgnat2why --prefix="${pkgdir}/usr"
    cd ..

    gprinstall -r --mode=usage -p -Pgnatprove --prefix="${pkgdir}/usr"

    rm -f -- "${pkgdir}/usr/bin/target.atp"

    install -Dm0644 docs/lrm/_build/man/spark2014refman.1    "${pkgdir}/usr/share/man/man7/spark2014_reference.7"
    install -Dm0644 docs/ug/_build/man/spark2014usersguide.1 "${pkgdir}/usr/share/man/man7/spark2014_userguide.7"
}