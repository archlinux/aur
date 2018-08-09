# Maintainer: Dictator Mei <dctxmei@gmail.com>
_pkgname=filebrowser
pkgname=filebrowser-git
pkgver=1.9.0
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app"
arch=('x86_64')
url="https://github.com/filebrowser/filebrowser"
license=('Apache')
makedepends=("dep" "git" "go" "yarn")
provides=('filebrowser')
conflicts=('filebrowser')
source=("filebrowser.service"
        "git+${url}.git")
sha512sums=("2652a8617d5252ed7393b47f70e43eac91083e6b6353b5acab476379bf5ca66b6ef09302bce94bb8cf9f4368ccd4a8b7d34600e686c9a2c15e95a1ca12a23eb6"
            "SKIP")

pkgver() {
    git -C $_pkgname describe --tags | sed -e 's/^v//' -e 's/-/./g'
}

build() {
    export GOPATH="$(pwd)/go"
    export PATH="$PATH:$GOPATH/bin"
    mkdir -p $GOPATH/src/github.com/$_pkgname
    mv $_pkgname $GOPATH/src/github.com/$_pkgname
    cd $GOPATH/src/github.com/$_pkgname/$_pkgname
    git submodule init
    git submodule update
    sed "s/(untracked)/$(git describe --tags | sed -e 's/^v//' -e 's/-/./g')/" -i filebrowser.go
    sh build/build_all.sh
}

package() {
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -Dm755 "$GOPATH"/src/github.com/$_pkgname/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
