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
source=("git+${url}.git")
md5sums=('SKIP')

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
    install -Dm755 "$GOPATH"/src/github.com/$_pkgname/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
