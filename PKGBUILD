pkgname=saturated
pkgver=20150921.4_b96240e
pkgrel=1
pkgdesc="Dead simple makepkg builder server"
arch=('i686' 'x86_64')
license=('GPL')
depends=('binutils' 'sudo' 'fakeroot')
makedepends=('go' 'git')
install="saturated.install"

source=(
    "saturated::git://github.com/seletskiy/saturated"
    "saturated.service"
    "20-makepkg"
)

md5sums=('SKIP'
         '45e69d6b83e64802a62b2b3e6909a55c'
         '2c20ab85afad8668481e61a924193617')

backup=(
)

pkgver() {
    cd "$srcdir/$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.${count}_$commit"
}

build() {
    cd "$srcdir/$pkgname"

    if [ -L "$srcdir/$pkgname" ]; then
        rm "$srcdir/$pkgname" -rf
        mv "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
    fi

    rm -rf "$srcdir/.go/src"

    mkdir -p "$srcdir/.go/src"

    export GOPATH="$srcdir/.go"

    mv "$srcdir/$pkgname" "$srcdir/.go/src/"

    cd "$srcdir/.go/src/$pkgname/"
    ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

    echo "Running 'go get'..."
    go get
}

package() {
    install -DT "$srcdir/.go/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -DT -m0755 "$srcdir/saturated.service" "$pkgdir/usr/lib/systemd/system/saturated.service"
    install -DT -m0640 "$srcdir/20-makepkg" "$pkgdir/etc/sudoers.d/20-makepkg"
    chmod 0750 "$pkgdir/etc/sudoers.d"
}
