# Contributor: Xiangpeng Hao <me@haoxp.xyz>

pkgname=pmdk-git
pkgver=2.1.2.r5.g9d3f4bf2a
pkgrel=1
pkgdesc="Persistent Memory Development Kit."
arch=("x86_64")
url="https://pmem.io"
license=('BSD-3-Clause')
depends=("glibc" "ndctl" "python" "sh")
makedepends=("chrpath" "git" "pandoc-cli")
checkdepends=("bc" "gdb" "man-db" "strace")
provides=("pmdk")
conflicts=("pmdk")
source=("git+https://github.com/daos-stack/pmdk.git")
sha256sums=('SKIP')

pkgver() {
    cd pmdk
    git describe --long | sed -r 's/-rc/rc/;s/([^-]*-g)/r\1/;s/-/./g'
}

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
