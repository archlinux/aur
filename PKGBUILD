# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=runc-git
pkgver=v1.0.0.rc2.r331.gc266f147
pkgrel=1
pkgdesc="Container CLI tools"
depends=('glibc')
makedepends=('git' 'godep' 'go')
arch=('x86_64' 'i686')
source=("git+https://github.com/opencontainers/runc.git")
url="http://runc.io/"
provides=('runc')
conflicts=('runc')
options=('!strip')
license=("APACHE")
sha256sums=('SKIP')

prepare() {
    cd $srcdir
    export GOPATH=$srcdir/go/
    export RUNCPATH=$GOPATH/src/github.com/opencontainers
    mkdir -p $RUNCPATH
    rm -fr $RUNCPATH/runc
    mv $srcdir/runc $RUNCPATH
}

build() {
    export GOPATH=$srcdir/go/
    export RUNCPATH=$GOPATH/src/github.com/opencontainers
    cd $RUNCPATH/runc
    make
    go install
}

package() {
    export GOPATH=$srcdir/go
    export LIBPATH=$GOPATH/pkg/linux_amd64/github.com/opencontainers/runc
    mkdir -p $pkgdir/usr/bin
    install -Dm755 $GOPATH/bin/runc $pkgdir/usr/bin/runc
    mkdir -p $pkgdir/usr/lib
    install -Dm755 $LIBPATH/libcontainer.a $pkgdir/usr/lib
    cp -r $LIBPATH/libcontainer $pkgdir/usr/lib/
}

pkgver() {
    export GOPATH=$srcdir/go
    export RUNCPATH=$GOPATH/src/github.com/opencontainers
    cd $RUNCPATH/runc
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
