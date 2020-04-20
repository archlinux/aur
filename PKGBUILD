# Maintainer: Adam Veldhousen adam@vdhsn.com
pkgname=powerbar
pkgver=makepkg
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

    cd "$srcdir/$pkgname"
    local VERSION=$(git describe --all | sed s:heads/::g)
    if [[ "$(echo $VERSION | grep "fatal: No names found")" ]]; then
        # local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
        # local count=$(git rev-list --count HEAD)
        local commit=$(git rev-parse --short HEAD)
        echo "$commit"
    fi

    echo $VERSION
}
