# Maintainer: a821 (at) mail de
# Contributor: envolution
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: Simon Krogmann <$(base64 --decode <<<'cy5rcm9nbWFubkB5YWhvby5jb20K')>

pkgname=pmdk
pkgver=2.1.4
pkgrel=1
pkgdesc="Persistent Memory Development Kit"
arch=('x86_64')
url="https://pmem.io/"
license=('BSD-3-Clause CDDL-1.0')
depends=("glibc" "ndctl" "python" "sh")
makedepends=("chrpath" "git" "pandoc-cli")
checkdepends=("bc" "gdb" "man-db" "strace")
source=("git+https://github.com/daos-stack/pmdk.git#tag=$pkgver")
sha256sums=('bce3be27a24dab408f4478cbde6171564b1be742377e302ff249b0f3d363fe64')

build() {
    cd pmdk
    make EXTRA_CFLAGS="-Wno-error" prefix=/usr LIB_PREFIX=lib
}

check() {
    cd pmdk
    cp -vf src/test/testconfig.sh{.example,}
    make check RUNTEST_OPTIONS="short" EXTRA_CFLAGS="-Wno-error"
}

package() {
    cd pmdk
    make DESTDIR="$pkgdir" prefix=/usr LIB_PREFIX=lib install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
    install -Dm644 -t "$pkgdir"/usr/share/bash-completion/completions \
                      "$pkgdir"/usr/etc/bash_completion.d/*
    rm -rf "$pkgdir/usr/etc/"

    # compile python files
    pushd "$pkgdir/usr/share/pmreorder"
    python -m compileall *.py
    popd

    # fix unsecure rpath (reported by namcap)
    chrpath -r /usr/lib "$pkgdir"/usr/lib/*.so
    chrpath -r /usr/lib/pmdk_debug:/usr/lib "$pkgdir"/usr/lib/pmdk_debug/*.so
}
