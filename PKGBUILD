# Maintainer: Dct Mei <dctxmei@gmail.com>
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
source=("git+${url}.git"
        "filebrowser.service")
sha512sums=("SKIP"
            "3b32f4fb7739afd6b2f7aeb372734e69ffe69e9a308a408a3e609b3b734053057f640343cce36110d8354bb132b0612b0fcf747b262aa0066651b39eb86bdbd0")

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
    sed "s/(untracked)/$(git describe --tags | sed -e 's/^v//' -e 's/-/./g')/" -i lib/filebrowser.go
    sh build/build_all.sh
}

package() {
    install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    sed -e 's/.pid/-%i.pid/' -e 's/config/%i/' -i filebrowser.service
    install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -Dm755 "$GOPATH"/src/github.com/$_pkgname/$_pkgname/cli/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
