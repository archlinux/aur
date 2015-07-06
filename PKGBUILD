# Maintainer: Jeppe Toustrup <archlinux@tenzer.dk>
pkgname=drafter-git
pkgver=r139.a3a987e
pkgrel=1
pkgdesc='Snowcrash parser harness'
arch=('any')
url='https://github.com/apiaryio/drafter'
license=('MIT')
makedepends=('git' 'python2')
provides=('drafter')
conflicts=('drafter')
source=('git://github.com/apiaryio/drafter.git'
        'git://github.com/apiaryio/snowcrash.git'
        'git://github.com/philsquared/Catch.git'
        'git://github.com/apiaryio/sos.git'
        'git://github.com/apiaryio/cmdline.git'
        'git://github.com/apiaryio/markdown-parser.git'
        'git://github.com/apiaryio/sundown.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/drafter"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    WORKPATH="${srcdir}/drafter"
    git -C "$WORKPATH" submodule init
    git -C "$WORKPATH" config submodule.ext/snowcrash.url "${srcdir}/snowcrash"
    git -C "$WORKPATH" config submodule.test/vendor/Catch.url "${srcdir}/Catch"
    git -C "$WORKPATH" config submodule.ext/sos.url "${srcdir}/sos"
    git -C "$WORKPATH" config submodule.ext/cmdline.url "${srcdir}/cmdline"
    git -C "$WORKPATH" submodule update

    WORKPATH="${srcdir}/drafter/ext/snowcrash"
    git -C "$WORKPATH" submodule init
    git -C "$WORKPATH" config submodule.test/vendor/Catch.url "${srcdir}/Catch"
    git -C "$WORKPATH" config submodule.ext/markdown-parser.url "${srcdir}/markdown-parser"
    git -C "$WORKPATH" submodule update

    WORKPATH="${srcdir}/drafter/ext/snowcrash/ext/markdown-parser"
    git -C "$WORKPATH" submodule init
    git -C "$WORKPATH" config submodule.ext/sundown.url "${srcdir}/sundown"
    git -C "$WORKPATH" config submodule.test/vendor/Catch.url "${srcdir}/Catch"
    git -C "$WORKPATH" submodule update

    WORKPATH="${srcdir}/drafter/ext/sos"
    git -C "$WORKPATH" submodule init
    git -C "$WORKPATH" config submodule.test/vendor/Catch.url "${srcdir}/Catch"
    git -C "$WORKPATH" submodule update
}

build() {
    cd "${srcdir}/drafter"
    python2 configure
    make
}

package() {
    install -D "${srcdir}/drafter/bin/drafter" "${pkgdir}/usr/bin/drafter"
}
