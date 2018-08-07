pkgname=spark2014-git
pkgver=0.3.draft.r17301.g094e550af
pkgrel=5

pkgdesc='formally defined programming language based on ada (gnat fsf)'
url='https://www.spark-2014.org'
arch=('x86_64')
license=('GPL')

options=('!makeflags')

depends=('gprbuild' 'python')
makedepends=('git' 'coq' 'gnatcoll-core' 'gprbuild' 'ocaml-num' 'ocaml-menhir'
             'ocaml-ocamlgraph' 'ocaml-zarith' 'ocaml-camlzip'
             'ocaml-ocplib-simplex' 'python-sphinx')
optdepends=('alt-ergo: alternative prover'
            'z3: alternative prover'
            'cvc4: alternative prover')

provides=('spark2014')
conflicts=('spark2014' 'why3')

source=('git+https://github.com/AdaCore/spark2014'
        'why3-adacore::git+https://github.com/AdaCore/why3'
        'git+https://github.com/gcc-mirror/gcc'
        'https://github.com/AdaCore/spark2014/files/2261639/sa_messages.ads.txt'
        'https://github.com/AdaCore/spark2014/files/2261640/sa_messages.adb.txt'
        'makefile-installdir-fixes.diff')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '6f3e5269b3d6e2b6c62d77976994056b7d32668ec2837b91e201405da52546a3'
            '9d4d0d228a025c1d723dbf9f18e2bfd1335f1d35a60360ad67f0cc55e2990a06'
            '2820a309db93782af029ba5b8492379e7aa2c58350629def00f748123866f3dd')

prepare() {
    cd spark2014
    git submodule init
    git config submodule.why3.url "$srcdir"/why3-adacore
    git submodule update why3

    ln -sf "$srcdir"/gcc/gcc/ada gnat2why/gnat_src

    # https://github.com/AdaCore/spark2014/issues/5#issuecomment-410622564
    ln -sf "$srcdir"/sa_messages.ads.txt gnat2why/gnat_src/sa_messages.ads
    ln -sf "$srcdir"/sa_messages.adb.txt gnat2why/gnat_src/sa_messages.adb

    # Use install instead of mv to install the various targets while also
    # houring the INSTALLDIR convention used within this Makefile.
    patch -Np1 -i "$srcdir"/makefile-installdir-fixes.diff

    # Arch Linux doesn't use libexec, everything lives under lib.
    sed -i 's/libexec/lib/g' gnatprove/configuration.ads
}

pkgver() {
    cd spark2014
    git describe --long --tags | sed 's/_/-/; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd spark2014
    make setup
    make
    make -C docs/lrm man
    make -C docs/ug man
}

check() {
    cd spark2014
    # XXX ImportError: No module named gnatpython.env
    # python2 testsuite/gnatprove/run-tests
    # python2 testsuite/gnatmerge/run-tests
}

package() {
    cd spark2014
    make INSTALLDIR="$pkgdir"/usr install-all install-examples

    install -Dm0755 install/bin/gnat2why "$pkgdir"/usr/bin/gnat2why
    install -Dm0755 install/bin/gnatprove "$pkgdir"/usr/bin/gnatprove
    install -Dm0755 install/bin/spark_codepeer_wrapper "$pkgdir"/usr/bin/spark_codepeer_wrapper
    install -Dm0755 install/bin/spark_memcached_wrapper "$pkgdir"/usr/bin/spark_memcached_wrapper
    install -Dm0755 install/bin/spark_report "$pkgdir"/usr/bin/spark_report

    # For some reason the spark install why3 drivers and the other bits
    # gnatprove needs to function.
    cp -a --no-preserve=ownership install/share/why3 "$pkgdir"/usr/share

    # Needed?
    # install -Dm0755 install/bin/why3cpulimit "$pkgdir"/usr/lib/spark/bin/why3cpulimit
    # rm -f -- "$pkgdir"/usr/bin/target.atp

    install -Dm0644 docs/lrm/_build/man/spark2014refman.1 "$pkgdir"/usr/share/man/man7/spark2014_reference.7
    install -Dm0644 docs/ug/_build/man/spark2014usersguide.1 "$pkgdir"/usr/share/man/man7/spark2014_userguide.7
}
