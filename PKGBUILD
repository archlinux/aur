# Contributor: Xiangpeng Hao <me@haoxp.xyz>

pkgname=pmdk-git
pkgver=2.1.1.r13.gd4da1b173
pkgrel=1
pkgdesc="Persistent Memory Development Kit."
arch=("x86_64")
url="https://pmem.io"
license=('BSD-3-Clause')
depends=("ndctl")
makedepends=("git" "pandoc-cli")
checkdepends=("bc" "gdb" "man-db" "python" "strace")
source=("git+https://github.com/pmem/pmdk.git")
md5sums=('SKIP')

pkgver() {
    cd pmdk
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd pmdk
    make EXTRA_CFLAGS="-Wno-error"
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
}
