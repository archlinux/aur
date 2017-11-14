# Maintainer: Kiril Zyapkov <kiril.zyapkov@gmail.com>
pkgname=mos-git
pkgver=2017111421
pkgrel=2
pkgdesc="Mongoose-OS build tool (latest)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://mongoose-os.com/software.html"
depends=('libftdi-compat' 'libusb')
makedepends=(
    'go'
    'git'
    'python2'
    'python2-gitpython'
    'govendor'
    'jshon'
)

source=(git+https://github.com/cesanta/mongoose-os.git#branch=master)

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/mongoose-os"
    sed -i 's,/usr/bin/env python,/usr/bin/env python2,g' "common/tools/fw_meta.py"
    python2 common/tools/fw_meta.py gen_build_info \
            --json_output=build_info.json >/dev/null 2>&1

    jshon -F build_info.json -e build_id -u > mos/version/build_id
    jshon -F build_info.json -e build_version -u > mos/version/version
    cat mos/version/version
}

build() {
    export GOPATH="$srcdir/go"
    export PATH="$srcdir/go/bin:$PATH"

    mkdir -p "$srcdir/go/src"
    mv "$srcdir/mongoose-os" "$srcdir/go/src/cesanta.com"
    cd "$srcdir/go/src/cesanta.com"

    govendor sync

    # these should not be needed, but they are
    # with  mongoose-os@6db2120a
    go get github.com/aws/aws-sdk-go/aws
    go get github.com/cesanta/go-git
    go get github.com/cesanta/errors

    make -C mos
}

package() {
    install -D $srcdir/go/src/cesanta.com/mos/mos $pkgdir/usr/bin/mos
}
