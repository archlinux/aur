# Maintainer: Adam Veldhousen adam@vdhsn.com
pkgname=powerbar
pkgver=v1.0.1.10
pkgrel=1
pkgdesc="Battery status module for Waybar"
arch=('x86_64')
url="https://github.com/adamveld12/$pkgname"
license=("GPL3")
depends=("upower>=0.99.11-1")
makedepends=("git" "go")
sha1sums=('SKIP')
source=(git://github.com/adamveld12/powerbar.git)

build() {
    cd $srcdir/$pkgname
    echo "checking out $pkgver"
	git checkout $pkgver

    go mod vendor
    go build -v \
		-mod=vendor \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS -X main.Version=$pkgver" \
        -o $pkgname .
}

check() {
    cd $srcdir/$pkgname
	go mod vendor
    go test -mod=vendor
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 -v $srcdir/$pkgname/$pkgname "$pkgdir/usr/bin/"
}

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

    cd $srcdir/$pkgname
    local VERSION=$(git describe --tags | sed s:-.*::g)
    if [[ "$(echo $VERSION | grep "fatal: No names found")" ]]; then
        # local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
        local commit=$(git rev-parse --short HEAD)
         echo ${commit}
         return
    fi

    echo ${VERSION}
}
